import 'package:aquascape_exercise/shared/theme.dart';
import 'package:aquascape_exercise/ui/widgets/aqualed_app_bar_exit.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cBlackColor,
        appBar: AqualedAppBarExit(),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 18,
                  ),
                  child: Text(
                    "About",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Text(
                    "Version : 1.0.0",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Text(
                    "Version : 1.0.0",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40, left: defaultMargin),
                  child: Text(
                    "Exercise FTUI",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, left: defaultMargin),
                  child: Text(
                    "Exercise FTUI",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
