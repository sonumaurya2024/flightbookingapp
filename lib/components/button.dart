import '../librearies.dart';

class CompButton extends StatefulWidget {
  final String title;
  final bool loading;
  final bool disable;
  final VoidCallback onPress;
  final bool removePaddings;
  final bool isLight;
  final bool isLogoutBtn;

  const CompButton(
      {Key? key,
      required this.title,
      this.loading = false,
      this.disable = false,
      required this.onPress,
      this.removePaddings = false,
      this.isLight = false,
      this.isLogoutBtn = false})
      : super(key: key);

  @override
  State<CompButton> createState() => _CompButtonState();
}

class _CompButtonState extends State<CompButton> {
  late ThemeChangerViewModel themeChangerViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
        navigatorKey.currentContext!,
        listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.disable
          ? null
          : widget.loading
              ? null
              : widget.onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: widget.removePaddings ? 35 : 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: widget.disable
                    ? LinearGradient(
                        begin: const Alignment(-1, -1),
                        end: const Alignment(-1, 1),
                        colors: <Color>[
                          themeChangerViewModel.getGreyColor,
                          themeChangerViewModel.getGreyColor
                        ],
                        stops: const <double>[0, 1],
                      )
                    : LinearGradient(
                        begin: const Alignment(-1, -1),
                        end: const Alignment(-1, 1),
                        colors: <Color>[
                          widget.isLight
                              ? themeChangerViewModel.getLightColor
                              : widget.isLogoutBtn
                                  ? themeChangerViewModel.getRedColor
                                  : themeChangerViewModel.getSecondaryColor,
                          widget.isLight
                              ? themeChangerViewModel.getLightColor
                              : widget.isLogoutBtn
                                  ? themeChangerViewModel.getRedColor
                                  : themeChangerViewModel.getSecondaryColor
                        ],
                        stops: const <double>[0, 1],
                      ),
                border: Border.all(
                    color: widget.isLight
                        ? themeChangerViewModel.getGreyColor
                        : Colors.white)),
            child: widget.loading
                ? Center(
                    child: SizedBox(
                        width: widget.removePaddings ? 11 : 20,
                        height: widget.removePaddings ? 11 : 20,
                        child: CircularProgressIndicator(
                            color: widget.disable
                                ? themeChangerViewModel.getWhiteColor
                                : themeChangerViewModel.getPrimaryColor)),
                  )
                : Center(
                    child: widget.disable || widget.isLight
                        ? Headings.whiteTextStyle(
                            title: widget.title,
                            enumFontSize: widget.removePaddings
                                ? EnumFontSize.extraSmall
                                : EnumFontSize.small)
                        : Headings.blackTextStyle(
                            title: widget.title,
                            enumFontSize: widget.removePaddings
                                ? EnumFontSize.extraSmall
                                : EnumFontSize.small)),
          ),
        ],
      ),
    );
  }
}
