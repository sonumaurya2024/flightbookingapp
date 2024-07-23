import '../librearies.dart';

class CompAppBar {
  static final themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
      navigatorKey.currentContext!,
      listen: false);
  static AppBar titleBar(
      {bool isBackButtonVisible = true, String title = "Test"}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: isBackButtonVisible
          ? Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child:
                  Consumer<ThemeChangerViewModel>(builder: (context, value, _) {
                return IconButton(
                  icon: Icon(Icons.arrow_back, color: value.getWhiteColor),
                  onPressed: () {
                    Navigator.of(navigatorKey.currentContext!).pop();
                  },
                );
              }),
            )
          : Container(),
      elevation: 0,
      title: TweenAnimationBuilder(
          child: Headings.secondaryTextStyle(title: title),
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeIn,
          builder: (BuildContext context, double val, Widget? child) {
            return Opacity(opacity: val, child: child);
          }),
      centerTitle: true,
    );
  }
}
