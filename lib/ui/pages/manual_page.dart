import 'package:flutter/material.dart';
import 'package:aquascape_exercise/shared/theme.dart';

class ManualPage extends StatelessWidget {
  const ManualPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                            fontSize: 22,
                            fontWeight: bold,
                            letterSpacing: 0.35),
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
              SizedBox(
                height: 32,
              ),
              Container(
                height: 76,
                decoration: BoxDecoration(
                    gradient: secondaryGradient,
                    borderRadius: BorderRadius.circular(defaultRadius)),
              ),
              SizedBox(
                height: 50,
              ),
              Lighting(),
              SizedBox(
                height: 50,
              ),
              SSlide(),
            ],
          ),
        ),
      ),
    );
  }
}

class Lighting extends StatelessWidget {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Color.fromRGBO(72, 72, 72, 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 21),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(89),
                      topRight: Radius.circular(89),
                      bottomLeft: Radius.circular(89),
                      bottomRight: Radius.circular(89),
                    ),
                    color: Color.fromRGBO(45, 45, 45, 1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('Lamp.png'),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Lighting',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Inter',
                            fontSize: 22,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 0.9545454545454546),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Aquarium 1',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(
                                235, 235, 245, 0.6000000238418579),
                            fontFamily: 'Inter',
                            fontSize: 13,
                            letterSpacing: -0.07800000160932541,
                            fontWeight: FontWeight.normal,
                            height: 1.3846153846153846),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Color.fromRGBO(66, 66, 66, 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 45,
                  height: 45,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(45, 45, 45, 1),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(45, 45)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 11.5,
                        left: 12.4755859375,
                        child: Container(
                          width: 21.02235984802246,
                          height: 21.766693115234375,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Image.asset(
                                  'Power.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Power',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Inter',
                            fontSize: 22,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 0.9545454545454546),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Aquarium 1',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color:
                              Color.fromRGBO(235, 235, 245, 0.6000000238418579),
                          fontFamily: 'Inter',
                          fontSize: 13,
                          letterSpacing: -0.07800000160932541,
                          fontWeight: FontWeight.normal,
                          height: 1.3846153846153846,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {},
                  activeTrackColor: cDarkOrange,
                  activeColor: cLightOrange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SSlide extends StatelessWidget {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      thumbColor: cDarkOrange,
      activeColor: cDarkOrange,
      max: 100,
      divisions: 100,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {},
    );
  }
}
