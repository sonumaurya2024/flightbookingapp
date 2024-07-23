import 'dart:async';

import '../../../librearies.dart';

class CommonScreen extends StatefulWidget {
  final Widget child;
  final bool loading;
  final AppBar? appBar;
  final bool isBackPress;
  final bool doubleBackPress;
  final Widget? bottomNavigationBar;
  final bool removePaddings;
  final bool isBottomShape;
  final RefreshCallback? refreshCallback;
  // final ScreenshotController? screenshotController;
  const CommonScreen({
    super.key,
    required this.child,
    this.loading = false,
    this.isBackPress = true,
    this.appBar,
    this.doubleBackPress = false,
    this.bottomNavigationBar,
    this.removePaddings = false,
    this.isBottomShape = false,
    this.refreshCallback,
    // this.screenshotController
  });

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  late ThemeChangerViewModel themeChangerViewModel;

  late Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
        navigatorKey.currentContext!,
        listen: false);

    // Initialize connectivity
    _connectivity = Connectivity();

    // Listen for connectivity changes
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      // Handle connectivity changes
      if (result == ConnectivityResult.none) {
        // WiFi is switched off
        CompFunctions.getConnectivity(widget.refreshCallback);
      }
    });

    // CompFunctions.getConnectivity(widget.refreshCallback);
  }

  DateTime? _lastPressedAt; // Track the time of the last back press

  @override
  Widget build(BuildContext context) {
    return widget.doubleBackPress
        ? DoubleBack(
            child: isRefresh(context: context),
          )
        : WillPopScope(
            onWillPop: () async {
              return widget.isBackPress;
            },
            child: isRefresh(context: context),
          );
  }

  isRefresh({required BuildContext context}) {
    if (widget.refreshCallback != null) {
      return CompRefreshIndicator.show(
          child: isScreenShot(context: context),
          onRefresh: widget.refreshCallback!);
    } else {
      return isScreenShot(context: context);
    }
  }

  isScreenShot({required BuildContext context}) {
    // if (widget.screenshotController == null) {
    return page(context: context);
    // } else {
    //   return Screenshot(
    //       child: page(context: context),
    //       controller: widget.screenshotController!);
    // }
  }

  page({required BuildContext context}) {
    return Scaffold(
      bottomNavigationBar: Wrap(
        children: [widget.bottomNavigationBar ?? Container()],
      ),
      backgroundColor: themeChangerViewModel.getWhiteColor,
      extendBodyBehindAppBar: true,
      appBar: widget.appBar,
      extendBody: false,
      body: SafeArea(
        child: AbsorbPointer(
          absorbing: widget.loading,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child: Visibility(
                    visible: widget.isBottomShape,
                    child: CompImage.showAssetWithColor(
                        path: "assets/common/images/bottom.png",
                        color: themeChangerViewModel.getWhiteColor),
                  )),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: widget.removePaddings ? 0 : 15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
