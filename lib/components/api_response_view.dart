import 'package:quiz_master/components/image.dart';

import '../librearies.dart';

class ApiResponseView {
  static final themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
      navigatorKey.currentContext!,
      listen: false);

  static loading() {
    return Center(
      child: CompImage.showLottie(
          jsonPath: "assets/common/lottie/loading.json", repeat: true),
    );
  }

  static serverError({required String msg}) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            color: themeChangerViewModel.getSecondaryColor,
            size: 150,
          ),
          Headings.whiteTextStyle(title: msg),
          // MasterSpacer.h.ten(),
          // Headings.greyTextStyle(title: msg,enumFontSize: EnumFontSize.extraSmall,
          // align: TextAlign.center)
        ],
      ),
    );
  }

  static error({required String msg}) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(25),
      child: Center(child: Headings.whiteTextStyle(title: msg)),
    );
  }

  static noDataFound({required String msg}) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: CompImage.showLottie(
          jsonPath: "assets/common/lottie/noData.json",
          repeat: false,
        ),
      ),
    );
  }
}
