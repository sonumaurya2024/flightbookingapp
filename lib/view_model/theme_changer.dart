import '../librearies.dart';

class ThemeChangerViewModel extends ChangeNotifier {
  ThemeData themeData = ThemeData.light().copyWith(
      // textTheme: Typography().white.apply(fontFamily: Constants.fontFamily),
      );
  ThemeData get getThemeData => themeData;

  Color primaryColor = const Color(0xFF282141);
  Color get getPrimaryColor => primaryColor;

  Color lightColor = const Color(0xFF4A4364);
  Color get getLightColor => lightColor;

  Color secondaryColor = const Color(0xffFFC107);
  Color get getSecondaryColor => secondaryColor;

  Color yellowColor = const Color(0xffFFC107);
  Color get getYellowColor => yellowColor;

  Color redColor = const Color(0xfffc6161);
  Color get getRedColor => redColor;

  Color greenColor = const Color(0xff508351); //0xff17e010
  Color get getGreenColor => greenColor;

  Color whiteColor = Colors.white;
  Color get getWhiteColor => whiteColor;

  Color blackColor = Colors.black;
  Color get getBlackColor => blackColor;

  Color greyColor = Colors.grey;
  Color get getGreyColor => greyColor;

  String index = "1";
  String get getIndex => index;

  ThemeMode themeMode = ThemeMode.dark;
  ThemeMode get getThemeMode => themeMode;

  void setTheme(String val) {
    // final isDark = themeData != currentTheme;
    index = val;
    if (val == "1") {
      themeMode = ThemeMode.dark;
      primaryColor = const Color(0xFF282141);
      lightColor = const Color(0xFF282141);
      secondaryColor = const Color(0xffFFC107);
      yellowColor = const Color(0xffFFC107);
      redColor = const Color(0xffFF0000);
      greenColor = const Color(0xff508351);
      whiteColor = Colors.white;
      blackColor = Colors.black;
      greyColor = Colors.grey;
    } else if (val == "2") {
      themeMode = ThemeMode.light;
      primaryColor = const Color(0xFFEDF0F3);
      lightColor = const Color(0xFF95A1AF);
      secondaryColor = Colors.orange;
      yellowColor = Colors.orange;
      redColor = const Color(0xffFF0000);
      greenColor = const Color(0xff508351);
      whiteColor = Colors.black;
      blackColor = Colors.white;
      greyColor = Colors.grey;
    } else {
      themeMode = ThemeMode.dark;
      primaryColor = const Color(0xFF1E2329);
      lightColor = const Color(0xFF2A333D);
      secondaryColor = const Color(0xffFFC107);
      yellowColor = const Color(0xffFFC107);
      redColor = const Color(0xffFF0000);
      greenColor = const Color(0xff508351);
      whiteColor = Colors.white;
      blackColor = Colors.black;
      greyColor = Colors.grey;
    }

    notifyListeners();
  }

  LoadingModel demoLoading =
      LoadingModel(status: Status.COMPLETED, message: "Init");
  LoadingModel get getDemoLoading => demoLoading;
  setDemoLoading(LoadingModel val) {
    demoLoading = val;
    notifyListeners();
  }

  notifyMe() {
    notifyListeners();
  }
}
