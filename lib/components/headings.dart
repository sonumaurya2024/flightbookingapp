import '../librearies.dart';

class Headings {
  static final themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
      navigatorKey.currentContext!,
      listen: false);
  static primaryTextStyle(
      {required String title,
      TextAlign align = TextAlign.left,
      double height = 0,
      EnumFontSize enumFontSize = EnumFontSize.medium,
      FontWeight fw = FontWeight.w800}) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        fontSize: MyFontSize.getFontSize(enumFontSize),
        fontWeight: fw,
        overflow: TextOverflow.ellipsis,
        fontFamily: 'Anta',
        color: themeChangerViewModel.getPrimaryColor,
      ),
    );
  }

  static secondaryTextStyle(
      {required String title,
      TextAlign align = TextAlign.left,
      double height = 0,
      TextOverflow overflow = TextOverflow.ellipsis,
      EnumFontSize enumFontSize = EnumFontSize.medium,
      FontWeight fw = FontWeight.w800,
      TextOverflow textOverflow = TextOverflow.ellipsis}) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        fontSize: MyFontSize.getFontSize(enumFontSize),
        fontWeight: fw,
        fontFamily: 'Anta',
        overflow: overflow,
        color: themeChangerViewModel.getSecondaryColor,
      ),
    );
  }

  static greyTextStyle(
      {required String title,
      TextAlign align = TextAlign.left,
      double height = 0,
      EnumFontSize enumFontSize = EnumFontSize.medium,
      FontWeight fw = FontWeight.w800}) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        fontSize: MyFontSize.getFontSize(enumFontSize),
        fontWeight: fw,
        fontFamily: 'Anta',
        color: themeChangerViewModel.getGreyColor,
      ),
      softWrap: true,
    );
  }

  static whiteTextStyle(
      {required String title,
      TextAlign align = TextAlign.left,
      double height = 0,
      EnumFontSize enumFontSize = EnumFontSize.medium,
      TextOverflow overflow = TextOverflow.ellipsis,
      FontWeight fw = FontWeight.w800}) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        fontSize: MyFontSize.getFontSize(enumFontSize),
        fontWeight: fw,
        overflow: overflow,
        fontFamily: 'Anta',
        color: themeChangerViewModel.getWhiteColor,
      ),
    );
  }

  static blackTextStyle({
    required String title,
    TextAlign align = TextAlign.left,
    double height = 0,
    EnumFontSize enumFontSize = EnumFontSize.medium,
    FontWeight fw = FontWeight.w800,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        fontSize: MyFontSize.getFontSize(enumFontSize),
        fontWeight: fw,
        fontFamily: 'Anta',
        color: themeChangerViewModel.getBlackColor,
      ),
      softWrap: true,
    );
  }

  static redTextStyle({
    required String title,
    TextAlign align = TextAlign.left,
    double height = 0,
    EnumFontSize enumFontSize = EnumFontSize.medium,
    FontWeight fw = FontWeight.w800,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        fontSize: MyFontSize.getFontSize(enumFontSize),
        fontWeight: fw,
        fontFamily: 'Anta',
        color: themeChangerViewModel.getRedColor,
      ),
      softWrap: true,
    );
  }

  static greenTextStyle({
    required String title,
    TextAlign align = TextAlign.left,
    double height = 0,
    EnumFontSize enumFontSize = EnumFontSize.medium,
    FontWeight fw = FontWeight.w800,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        fontSize: MyFontSize.getFontSize(enumFontSize),
        fontWeight: fw,
        fontFamily: 'Anta',
        color: themeChangerViewModel.getGreenColor,
      ),
      softWrap: true,
    );
  }

  static customTextStyle(
      {required String title,
      TextAlign align = TextAlign.left,
      double height = 0,
      double? fontSize,
      FontWeight fw = FontWeight.w800,
      TextOverflow overflow = TextOverflow.ellipsis,
      Color color = Colors.white}) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize ?? MyFontSize.getFontSize(EnumFontSize.medium),
        fontWeight: fw,
        fontFamily: 'Anta',
        color: color,
      ),
      softWrap: true,
    );
  }
}
