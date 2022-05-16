import 'package:flutter/material.dart';
import 'package:aquascape_exercise/shared/theme.dart';

class ManualPage extends StatelessWidget {
  const ManualPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: cBlackColor,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'images/Light.png',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/Logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
