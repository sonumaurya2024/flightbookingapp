import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import '../app_exception.dart';
import 'BaseApiService.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    String _data = json.encode(data);
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url),
          headers: {
            "accept": "*/*",
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin":
                "*", // Required for CORS support to work
            // Required for cookies, authorization headers with HTTPS
            "Access-Control-Allow-Headers":
                "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
            "Access-Control-Allow-Methods": "POST, OPTIONS",
          },
          body: _data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(" No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostUploadImageApiResponse(
      String url, String bearerToken, String filePath) async {
    dynamic responseJson;
    try {
      // Create a file object from the file path
      final File file = File(filePath);

      // Create a multipart request
      final request = http.MultipartRequest('POST', Uri.parse(url));

      // Add the Bearer token to the request headers
      request.headers['Authorization'] = 'Bearer $bearerToken';

      // Add other form fields if needed (e.g., text fields)
      // request.fields['field1'] = 'value1';

      // Add the file as a multipart form field
      request.files.add(await http.MultipartFile.fromPath(
        'file', // This should match the field name expected by the API
        file.path,
        contentType:
            MediaType('image', 'jpeg'), // Replace with your file's content type
      ));
      final response = await request.send();

      if (response.statusCode == 200) {
        // Request was successful
        String responseBody = await response.stream.bytesToString();
        dynamic jsonData = jsonDecode(responseBody);
        String docUrl = "";
        if (jsonData['result']['variants'][0].toString().endsWith("thumb")) {
          docUrl = jsonData['result']['variants'][1];
        } else {
          docUrl = jsonData['result']['variants'][0];
        }

        responseJson = docUrl;
      } else {
        // Request failed with an error status code
        throw FetchDataException("Something went wrong");
      }
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        //created
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw ServerDataException(
            "Sorry for inconvenience. Server not responding come back later");
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            "${response.statusCode}No Internet Connection");
    }
  }
}
