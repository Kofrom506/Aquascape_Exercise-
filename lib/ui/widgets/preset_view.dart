// import 'package:flutter/material.dart';
// import '../../shared/theme.dart';
//
// class CustomTextFormField extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;
//
//   const CustomTextFormField({
//     Key? key,
//     required this.hintText,
//     required this.controller,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 12),
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: cDarkGreyColor, borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//             cursorColor: cWhiteColor,
//             controller: controller,
//             style: WhiteFont,
//             decoration: InputDecoration(
//                 hintText: hintText,
//                 hintStyle: WhiteFont,
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide(color: cDarkGreyColor)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide(color: cWhiteColor))),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:aquascape_exercise/model/preset_model.dart';
import 'package:aquascape_exercise/ui/pages/AddPresetPage.dart';


class PresetView extends StatelessWidget {
  PresetView({required this.presetModel1, required this.presetModel2});
  PresetModel presetModel1;
  PresetModel presetModel2;
  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Expanded(
            child: InkWell(
              child: Container(
                height: 120,
                width: 1000,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xffED1CFF),
                    Color(0xffFA7171)
                  ]),
                  borderRadius:
                  BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      left: 15, top: 10),
                  child: Text(
                    presetModel1.presetName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                print(presetModel1.presetName);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPresetPage()),
                );
                BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius:
                    BorderRadius.circular(10));
              },
            ),
          ),
          Expanded(
            child: InkWell(
              child: Container(
                height: 120,
                width: 1000,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xffED1CFF),
                    Color(0xffFA7171)
                  ]),
                  borderRadius:
                  BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      left: 15, top: 10),
                  child: Text(
                    presetModel2.presetName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              onTap:() {
                print(presetModel2.presetName);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPresetPage()),
                );
                BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius:
                    BorderRadius.circular(10));
              },
            ),
          ),
        ],
      );
  }
}

class PresetView1 extends StatelessWidget {
  // String presetId;
  PresetView1({required this.presetModel});
  PresetModel presetModel;
  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Expanded(
            child: InkWell(
              child: Container(
                height: 120,
                width: 1000,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xffED1CFF),
                    Color(0xffFA7171)
                  ]),
                  borderRadius:
                  BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      left: 15, top: 10),
                  child: Text(
                    presetModel.presetName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                print(presetModel.presetName);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPresetPage()),
                );
                BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius:
                    BorderRadius.circular(10));
              },
            ),
          ),
          Expanded(
            child: Container(
              height: 120,
              width: 1000,),
          )
        ],
      );
  }
}

