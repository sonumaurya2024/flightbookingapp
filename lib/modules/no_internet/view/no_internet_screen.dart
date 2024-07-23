import 'dart:async';

import 'package:quiz_master/components/headings.dart';
import 'package:quiz_master/utils/spacer.dart';

import '../../../librearies.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  late ThemeChangerViewModel themeChangerViewModel;
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
        navigatorKey.currentContext!,
        listen: false);

    checkInternetStatus();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final ab = await CompFunctions.getConnectivityStatus();
        return ab;
      },
      child: Scaffold(
        backgroundColor: themeChangerViewModel.getPrimaryColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/common/wifi.png',
                  width: 100,
                  height: 100,
                ),
                MasterSpacer.h.ten(),
                MasterSpacer.h.ten(),
                Headings.whiteTextStyle(title: "No Internet Connection.")
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkInternetStatus() async {
    bool status = await CompFunctions.getConnectivityStatus();
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      if (!status) {
        checkInternetStatus();
      } else {
        Navigator.pop(context);
      }
    });
  }
}
