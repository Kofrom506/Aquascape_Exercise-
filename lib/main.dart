import 'package:flutter/material.dart';
import 'ui/pages/auto_page.dart';
import 'ui/pages/manual_page.dart';
import 'ui/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Splash(),
      },
    );
  }
}
//dsujadiahdaiuhd