import '../../../librearies.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
      isBottomShape: true,
      removePaddings: true,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Constants.defaultPagePaddingHorizontally),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              CompImage.showAsset(
                path: "assets/common/images/login.png",
              ),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              Headings.whiteTextStyle(
                  title: "Login",
                  enumFontSize: EnumFontSize.larger,
                  align: TextAlign.start),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              CompTextField.email(),
              CompTextField.password(obscurePassword: ValueNotifier(false)),
              CompTextField.password(obscurePassword: ValueNotifier(false)),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              CompButton(
                  title: "Login",
                  onPress: () async {
                    await Navigator.push(
                      navigatorKey.currentContext!,
                      PageTransition(
                        child: const OtpVerificationScreen(
                            email: "test@gmail.com"),
                        type: PageTransitionType.rightToLeft,
                      ),
                    ).then((value) {
                      if (value == "Verify") {
                        CompDialog.showToast(
                            context: context, msg: "OTP Verified");

                        CompFunctions.delay(seconds: 1).then((value) {
                          // Navigator.push(
                          //   navigatorKey.currentContext!,
                          //   PageTransition(
                          //     child: TestDashboardScreen(),
                          //     type: PageTransitionType.rightToLeft,
                          //   ),
                          // );
                        });
                      }
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
