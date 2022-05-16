import 'package:flutter/material.dart';
import 'ui/pages/automatic/auto_page.dart';
import 'ui/pages/automatic/addPresetView.dart';

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
