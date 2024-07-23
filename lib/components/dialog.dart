import '../librearies.dart';

class CompDialog {
  static final themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
      navigatorKey.currentContext!,
      listen: false);

  static Future showReCheck({
    String title = 'Please re-check information',
    required String msg,
  }) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                backgroundColor: themeChangerViewModel.getPrimaryColor,
                shape: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: themeChangerViewModel.getWhiteColor),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                title: Column(
                  children: [
                    Headings.whiteTextStyle(
                        title: title, enumFontSize: EnumFontSize.medium),
                    MasterSpacer.h.five(),
                    MasterSpacer.h.five(),
                    Headings.whiteTextStyle(
                        title: msg,
                        overflow: TextOverflow.clip,
                        align: TextAlign.center,
                        enumFontSize: EnumFontSize.small),
                  ],
                ),
                actions: [
                  CompButton(
                    title: "Cancel",
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: navigatorKey.currentContext!,
        pageBuilder: (context, animation1, animation2) {
          return const Center();
        });
  }

  static void showToast(
      {String msg = 'Something went wrong',
      required BuildContext context,
      int autoCloseDuration = 3}) {
    toastification.show(
      context: context,
      title: Headings.whiteTextStyle(title: msg, overflow: TextOverflow.clip),
      autoCloseDuration: Duration(seconds: autoCloseDuration),
      icon: Image.asset(
        Constants.tLogo,
        width: 25,
      ),
      foregroundColor: themeChangerViewModel.getSecondaryColor,
      backgroundColor: themeChangerViewModel.getPrimaryColor,
      alignment: Alignment.bottomCenter,
      dragToClose: true,
      progressBarTheme: ProgressIndicatorThemeData(
          color: themeChangerViewModel.getSecondaryColor,
          linearTrackColor: themeChangerViewModel.getGreyColor),
      boxShadow: [
        BoxShadow(
          color: themeChangerViewModel.whiteColor,
          blurRadius: 2,
          offset: const Offset(0.1, 0.1),
          spreadRadius: 0.1,
        )
      ],
    );
  }
}
