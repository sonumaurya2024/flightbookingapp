abstract class BaseApiServices{
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic>   getPostApiResponse(String url, dynamic data);

  Future<dynamic>   getPostUploadImageApiResponse(String url,String bearerToken, String filePath);

}