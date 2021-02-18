import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_app/services_locator.dart';
import 'package:my_app/services/navigation.dart';
import 'package:my_app/ui/sign_in/sign_in_view.dart';
import 'package:my_app/ui/splash/splash_view.dart';
import 'package:my_app/ui/root/root_view.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _navigation = servicesLocator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    /// - #3f3f3f グレー
    /// - #dfefff 薄い青
    final appTheme = ThemeData(
      primaryColor: Color(0xff3f3f3f),
      backgroundColor: Color(0xffdfefff),
      textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      navigatorKey: _navigation.navigatorKey,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashView(),
        '/sign_in': (context) => SignInView(),
        '/root': (context) => RootView(),
        // '/settings': (context) => SettingsPage(),
      },
    );
  }
}
