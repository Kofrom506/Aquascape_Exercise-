import 'package:aquascape_exercise/shared/theme.dart';
import 'package:aquascape_exercise/ui/widgets/aqualed_app_bar.dart';
import 'package:flutter/material.dart';

class BluetoothPage extends StatelessWidget {
  const BluetoothPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AqualedAppBar(),
      backgroundColor: cBlackColor,
      //edit body nya yaa
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Text(
                    'Available Device',
                    textAlign: TextAlign.left,
                    style: WhiteFont.copyWith(fontSize: 22, fontWeight: medium),
                  ),
                ),
                SizedBox(height: 17),
                GestureDetector(
                  child: Container(
                    height: 76,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      color: cGreyColor,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Device Name',
                          textAlign: TextAlign.left,
                          style: WhiteFont.copyWith(
                              fontSize: 20, fontWeight: medium),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Device Addres',
                          textAlign: TextAlign.left,
                          style: greyFont.copyWith(
                            fontSize: 13,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 17),
                GestureDetector(
                  child: Container(
                    height: 76,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      color: cGreyColor,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Device Name',
                          textAlign: TextAlign.left,
                          style: WhiteFont.copyWith(
                              fontSize: 20, fontWeight: medium),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Device Addres',
                          textAlign: TextAlign.left,
                          style: greyFont.copyWith(
                              fontSize: 13, fontWeight: medium),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 17),
                GestureDetector(
                  child: Container(
                    height: 46,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        gradient: secondaryGradient),
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                    child: Text('Connect',
                        textAlign: TextAlign.center,
                        style:
                            WhiteFont.copyWith(fontWeight: bold, fontSize: 20)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
