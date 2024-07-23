import 'package:flutter_svg/flutter_svg.dart';

import '../librearies.dart';

class CompImage {
  static showLottie({required String jsonPath, required bool repeat}) {
    return Lottie.asset(jsonPath,
        width: 200, repeat: repeat, fit: BoxFit.contain);
  }

  static final themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
      navigatorKey.currentContext!,
      listen: false);

  static showAssetWithColor({required String path, Color? color}) {
    return Image.asset(
      path,
      fit: BoxFit.contain,
      color: color ?? themeChangerViewModel.getSecondaryColor,
    );
  }

  static showAsset(
      {required String path, Alignment alignment = Alignment.center}) {
    return Container(
      alignment: alignment,
      child: Image.asset(
        path,
        fit: BoxFit.contain,
      ),
    );
  }

  static showSvg(
      {required String path, Alignment alignment = Alignment.center}) {
    return Container(
      alignment: alignment,
      child: SvgPicture.asset(
        path,
        fit: BoxFit.contain,
      ),
    );
  }
}
