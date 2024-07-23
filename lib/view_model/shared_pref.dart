import 'dart:convert';

import '../librearies.dart';

class SharedPrefViewModel with ChangeNotifier {
  String key = "User";
  String apiKey = "ApiKey";
  String onBoardingKey = "OnBoardingStat";
  String notificationKey = "notificationKey";

  Future<bool> saveUser(dynamic user) async {
    String json = jsonEncode(user);
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, json);
    notifyListeners();
    return true;
  }

  Future<bool> saveOnBoarding() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(onBoardingKey, true);
    notifyListeners();
    return true;
  }

  Future<bool> getOnBoarding() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final bool? onBoarding = sp.getBool(onBoardingKey);

    if (onBoarding == null) {
      return false;
    } else {
      return onBoarding == true;
    }
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getString(key) != null) {
      final dynamic user = sp.getString(key);
      return UserModel.fromJson(jsonDecode(user));
    } else {
      return UserModel();
    }
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
    sp.remove(onBoardingKey);
    return true;
  }

  Future<bool> logout() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
    return true;
  }

  Future<bool> saveCryptoAddress(dynamic user) async {
    String json = jsonEncode(user);
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, json);
    notifyListeners();
    return true;
  }

  Future<void> saveWalletScreen() async {}

  Future<bool> saveApiKey(String user) async {
    // String json = jsonEncode(user);
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(apiKey, user);
    notifyListeners();
    return true;
  }

  Future<dynamic> getApiKey() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final dynamic user = sp.getString(apiKey);
    return user.toString();
  }

  Future<bool> saveNotificationStatus(bool value) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(notificationKey, value);
    notifyListeners();
    return true;
  }
}
