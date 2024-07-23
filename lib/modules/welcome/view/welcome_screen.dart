import '../../../librearies.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
        child: Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Headings.customTextStyle(
                title: "Join a community of creator",
                fontSize: 30,
                align: TextAlign.center),
            MasterSpacer.h.ten(),
            Headings.greyTextStyle(
                title:
                    "A simple ,fun ,and creative way to share photos ,videos, messages with friends and family.",
                enumFontSize: EnumFontSize.small,
                align: TextAlign.center),
            MasterSpacer.h.ten(),
            MasterSpacer.h.ten(),
            Image.asset(
              Constants.splash,
              width: MediaQuery.of(context).size.width / 2,
            ),
            MasterSpacer.h.ten(),
            MasterSpacer.h.ten(),
            CompButton(
                title: "Sign In",
                onPress: () {
                  Navigator.push(
                    navigatorKey.currentContext!,
                    PageTransition(
                      child: const SignInScreen(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                }),
            MasterSpacer.h.ten(),
            CompButton(
                title: "Sign Up",
                onPress: () {
                  Navigator.push(
                    navigatorKey.currentContext!,
                    PageTransition(
                      child: const SignInScreen(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                }),
          ],
        ),
      ),
    ));
  }
}
