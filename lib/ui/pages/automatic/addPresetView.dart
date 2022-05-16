import 'package:flutter/material.dart';
import 'package:aquascape_exercise/shared/theme.dart';
import 'package:aquascape_exercise/Model/presetModel.dart';

class AddPresetPage extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: cBlackColor,
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                                image: AssetImage('logo.png'),
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
                            image: AssetImage('setting.png'),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Text(
                'Add Preset',
                textAlign: TextAlign.end,
                style: WhiteFont.copyWith(fontSize: 32, fontWeight: bold),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  color: cGreyColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          Container(
                            // padding: EdgeInsets.all(20),
                            width: 17,
                            height: 17,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(


                              shape: BoxShape.circle,
                                // borderRadius:  BorderRadiusDirectional.all(20),
                                color: cDarkGreyColor,

                                image: DecorationImage(

                                  image: AssetImage('setting.png'),
                                  fit: BoxFit.cover,

                                )),
                                // image: DecorationImage(
                                //     image: AssetImage('setting.png'),
                                //     fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Schedule',
                                textAlign: TextAlign.start,
                                style: WhiteFont.copyWith(
                                    fontSize: 15, fontWeight: bold),
                              ),
                              Text(
                                '17 Agustus 2022',
                                textAlign: TextAlign.start,
                                style: WhiteFont.copyWith(
                                    fontSize: 10, fontWeight: FontWeight.normal)
                                ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 10),
                      ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: entries.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text("from",
                                        style: WhiteFont.copyWith(
                                            fontSize: 8, fontWeight: FontWeight.normal)),
                                    Text("05:00 pm",
                                        style: WhiteFont.copyWith(
                                            fontSize: 10, fontWeight: semiBold)),
                                    Text("to",
                                        style: WhiteFont.copyWith(
                                            fontSize: 8, fontWeight: FontWeight.normal)),
                                    Text("05:00 pm",
                                        style: WhiteFont.copyWith(
                                            fontSize: 10, fontWeight: semiBold)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Intensity",
                                        style: WhiteFont.copyWith(
                                            fontSize: 8, fontWeight: bold)),
                                    Text("75%",
                                        textAlign:TextAlign.end,
                                        style: WhiteFont.copyWith(
                                            fontSize: 10, fontWeight: semiBold)
                                    ),
                                  ],
                                ),

                              ],



                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
    //
  }
}

class _Slider extends StatefulWidget {
  @override
  __SliderState createState() => __SliderState();
}

class __SliderState extends State<_Slider> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// class  extends StatefulWidget {
//   @override
//   _State createState() => _State();
// }
//
// class _State extends State<> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
