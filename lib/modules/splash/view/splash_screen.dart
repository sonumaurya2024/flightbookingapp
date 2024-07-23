import '../../../librearies.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeChangerViewModel themeChangerViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
        navigatorKey.currentContext!,
        listen: false);
    // themeChangerViewModel.setTheme("1");
    // SplashServices().checkAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      removePaddings: true,
      child: Stack(
        children: [
          AnimatedSplashScreen.withScreenFunction(
            disableNavigation: true,
            splash: Constants.splash,
            splashIconSize: 300,
            backgroundColor: themeChangerViewModel.getPrimaryColor,
            screenFunction: () async {
              return SplashServices.screen();
            },
            splashTransition: SplashTransition.fadeTransition,
          ),
          Positioned.fill(
              top: 200,
              child: Center(
                child: Headings.whiteTextStyle(
                    title: "METEOR", enumFontSize: EnumFontSize.larger),
              ))
        ],
      ),
    );
  }
}
