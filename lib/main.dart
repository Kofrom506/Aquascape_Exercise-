import 'package:aquascape_exercise/ui/pages/AddPresetPage.dart';
import 'package:flutter/material.dart';
import 'ui/pages/auto_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => AddPresetPage(),
      },
    );
  }
}
