import 'dart:io';

import 'package:intl/intl.dart';

import '../librearies.dart';

class CompFunctions {
  static Future delay({int seconds = 2}) async {
    return Future.delayed(Duration(seconds: seconds));
  }

  static Future<bool> delayWidget({int milliseconds = 300}) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    return true;
  }

  static void fieldFocusChange(
      {required FocusNode currentFocusNode, required FocusNode nextFocusNode}) {
    currentFocusNode.unfocus();
    FocusScope.of(navigatorKey.currentContext!).requestFocus(nextFocusNode);
  }

  static void setFieldFocus({required FocusNode nextFocus}) {
    FocusScope.of(navigatorKey.currentContext!).requestFocus(nextFocus);
  }

  static void unFocus() {
    FocusScope.of(navigatorKey.currentContext!).unfocus();
  }

  static String getRoundUpTo(dynamic number, {int upto = 6}) {
    if (number == 'null' || number.toString().isEmpty || number == null) {
      return "0";
    } else {
      double numb = double.parse(number.toString());

      String n = numb.toStringAsFixed(upto);
      double val = double.parse(n);
      RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
      String s = val.toString().replaceAll(regex, '');

      return numb < 0 ? "0" : s;
    }
  }

  static String getRoundUpString(String text, {int upto = 17}) {
    if (text.length > upto) {
      return "${text.substring(0, upto)}..";
    } else {
      return text;
    }
  }

  // static takeScreenshotAndShare(
  //     {required ScreenshotController screenshotController}) async {
  //   final imageUint8List = await screenshotController.capture();
  //   final tempDir = await getTemporaryDirectory();
  //   final imageFile = File('${tempDir.path}/screenshot.png');
  //   await imageFile.writeAsBytes(imageUint8List!);
  //
  //   if (imageFile.existsSync()) {
  //     Share.shareFiles([imageFile.path]);
  //   } else {
  //     // Handle the case when the screenshot capture failed.
  //     mDebugPrint('Screenshot capture failed!');
  //   }
  // }

  static setCursorLast({required TextEditingController controller}) {
    // Set the cursor at the end of the text
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  static getCryptoAddress({required String address}) {
    String response = address;
    if (address.length > 16) {
      response =
          "${address.substring(0, 4)}...${address.substring(address.length - 4, address.length)}";
    }
    return response;
  }

  static Future<File?> getImageFromGallery() async {
    File? docImage;

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      final temporaryImage = File(image.path);
      docImage = temporaryImage;
      mDebugPrint(docImage.path);
    }
    return docImage;
  }

  static getEnumString({required String enumInput}) {
    if (enumInput.isEmpty) {
      return enumInput;
    }

    List<String> letter = enumInput.split('');
    String conCatString = "";
    for (int i = 0; i < letter.length; i++) {
      if (letter[i] == letter[i].toUpperCase()) {
        conCatString = "$conCatString ${letter[i]}";
      } else {
        conCatString = conCatString + letter[i];
      }
    }

    List<String> words = conCatString.split(' ');
    List<String> titleCaseWords = [];

    for (String word in words) {
      if (word.isNotEmpty) {
        titleCaseWords
            .add('${word[0].toUpperCase()}${word.substring(1).toLowerCase()}');
      }
    }

    return titleCaseWords.join(' ');
  }

  static getEnumValue(
      {required List<String> listReq,
      required String response,
      required String value}) {
    // for(int i = 0 ; i < enumValue.values)
    //  print(enumValue);
  }

  static getConnectivity(RefreshCallback? refreshCallback) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      await Navigator.push(
        navigatorKey.currentContext!,
        PageTransition(
          child: const NoInternetScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );

      refreshCallback?.call();
    }
  }

  static getConnectivityStatus() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  static getDateFormatFromDate({required DateTime dateTime}) {
    return DateFormat('yyyy/MM/dd HH:mm').format(dateTime);
  }

  static getDateFormatFromString({required String? dateTime}) {
    return DateFormat('yyyy/MM/dd HH:mm')
        .format(DateTime.parse(dateTime ?? Constants.defaultDate.toString()));
  }

  static Future<Address?> getUserLocation() async {
    //call this async method from whereever you need
    Address? cAddress;
    const apiKey = 'AIzaSyAQbfByWg2c2B38lqXrkJolpMJ8Saua_Iw';
    final LocatitonGeocoder geocoder = LocatitonGeocoder(apiKey);

    await getLatLong(navigatorKey.currentContext!).then((value) async {
      final address = await geocoder.findAddressesFromCoordinates(
          Coordinates(value!.latitude, value.longitude));
      cAddress = address.first;
    });
    return cAddress;
  }

  static Future<Position?> getLatLong(context) async {
    Position? currentPosition;

    final hasPermission = await _handleLocationPermission(context);

    if (!hasPermission) return currentPosition;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
    }).catchError((e) {
      debugPrint(e);
    });
    return currentPosition;
  }

  static Future<String> getIpAddress() async {
    String ip = '';
    try {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          if (addr.type == InternetAddressType.IPv4) {
            ip = addr.address;
            mDebugPrint('IP address: ${addr.address}');
          }
        }
      }
    } catch (e) {
      mDebugPrint('Failed to get IP address: $e');
    }
    return ip;
  }

  static Future<bool> _handleLocationPermission(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  static String formatTime(String datetime) {
    DateTime nDateTime = DateTime.parse(datetime);
    Duration difference = DateTime.now().difference(nDateTime);

    if (difference.isNegative) {
      return "0";
    }
    int seconds = difference.inSeconds;

    if (seconds < 60) {
      return "now";
    } else {
      int minutes = seconds ~/ 60;
      if (minutes < 60) {
        return "${minutes}m";
      } else {
        int hours = minutes ~/ 60;
        int remainingMinutes = minutes % 60;

        if (hours < 24) {
          return "${hours}h ${remainingMinutes}m";
        } else {
          int days = hours ~/ 24;
          int remainingHours = hours % 24;
          return "${days}d ${remainingHours}h ${remainingMinutes}m";
        }
      }
    }
  }
}
