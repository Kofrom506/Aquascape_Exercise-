import 'package:aquascape_exercise/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:aquascape_exercise/model/preset_model.dart';
import 'package:aquascape_exercise/ui/pages/AddPresetPage.dart';

class PresetView extends StatelessWidget {
  PresetView(
      {required this.presetModel1,
      required this.presetModel2,
      required this.leftGradient,
      required this.rightGradient});
  PresetModel presetModel1;
  PresetModel presetModel2;
  LinearGradient leftGradient;
  LinearGradient rightGradient;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              height: 120,
              width: 1000,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: leftGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 10),
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
                  borderRadius: BorderRadius.circular(10));
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
                gradient: rightGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 10),
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
            onTap: () {
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
                  borderRadius: BorderRadius.circular(10));
            },
          ),
        ),
      ],
    );
  }
}

class PresetView1 extends StatelessWidget {
  // String presetId;
  PresetView1({required this.presetModel, required this.leftGradient});
  PresetModel presetModel;
  LinearGradient leftGradient;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              height: 120,
              width: 1000,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: leftGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 10),
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
                  borderRadius: BorderRadius.circular(10));
            },
          ),
        ),
        Expanded(
          child: Container(
            height: 120,
            width: 1000,
          ),
        )
      ],
    );
  }
}
