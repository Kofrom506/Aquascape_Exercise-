import 'package:aquascape_exercise/shared/theme.dart';
import 'package:flutter/material.dart';

class AutoPage extends StatelessWidget {
  const AutoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBlackColor,
      body: Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Container(
                      width: smallLogo,
                      height: smallLogo,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo.png'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'AQUALED',
                      style: WhiteFont.copyWith(
                          fontSize: 22, fontWeight: bold, letterSpacing: 0.35),
                    ),
                  ],
                )),
                Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/setting.png'),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
            //logo aquascape
          ],
        ),
      ),
    );
  }
}
