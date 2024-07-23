import '../../../librearies.dart';

class SplashServices {
  static Future<Widget> screen() async {
    await CompFunctions.delay(seconds: 0);

    bool isOnboarding = await SharedPrefViewModel().getOnBoarding();
    if (isOnboarding) {
      return const WelcomeScreen();
    } else {
      await SharedPrefViewModel().saveOnBoarding();
      return const OnBoardingScreen();
    }
  }
}
