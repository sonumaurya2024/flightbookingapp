import 'dart:io';

import 'librearies.dart';
import 'screens/homepage.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());

  // runApp(
  //   DevicePreview(
  //       enabled: !kReleaseMode,
  //       builder: (context) => const MyApp() // Wrap your app
  //       ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0,
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeChangerViewModel()),
        ],
        child: ChangeNotifierProvider<ThemeChangerViewModel>(
            create: (context) => ThemeChangerViewModel(),
            builder: (context, child) {
              final provider = Provider.of<ThemeChangerViewModel>(context);
              return MaterialApp(
                // builder: DevicePreview.appBuilder, // device preview
                navigatorKey: navigatorKey,
                title: Constants.appName,
                debugShowCheckedModeBanner: false,
                debugShowMaterialGrid: false,
                theme: provider.getThemeData,
                home: const HomePage(),
              );
            }),
      ),
    );
  }
}
