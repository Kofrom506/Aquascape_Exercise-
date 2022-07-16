import 'dart:ui';
import 'package:aquascape_exercise/shared/theme.dart';
import 'package:aquascape_exercise/ui/widgets/preset_view.dart';
import 'package:flutter/material.dart';
import 'package:aquascape_exercise/model/preset_model.dart';
import 'package:aquascape_exercise/ui/widgets/preset_view.dart';
// import 'package:aquascape_exercise/ui/widgets/preset_view.dart';

class AddPresetWidget extends StatefulWidget {
  List<LinearGradient> colorGradient = [
    pinkGradient,
    secondaryGradient,
    greenGradient,
    blueGradient
  ];
  @override
  State<AddPresetWidget> createState() =>
      _MyAddPresetWidgetState(colorGradient: colorGradient);
}

class _MyAddPresetWidgetState extends State<AddPresetWidget> {
  _MyAddPresetWidgetState({required this.colorGradient});

  List<Widget> box = [];
  List<PresetModel> preset = [];
  int counter = 1;
  int colorCounter = 0;
  List<LinearGradient> colorGradient;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Preset",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(left: 10, top: 30)),
              InkWell(
                child: Container(
                    child: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                )),
                onTap: () {
                  setState(() {
                    box.clear();
                    print("Clicked");
                    print(counter);
                    preset.add(PresetModel(
                        presetName: "Preset " + counter.toString()));

                    for (int i = 0; i < counter; i++) {
                      if (colorCounter == colorGradient.length) {
                        colorCounter = 0;
                      }
                      if ((i + 1) % 2 == 0) {
                        if (colorCounter > (colorGradient.length - 1) - 2) {
                          colorCounter--;
                        }
                        box.removeLast();
                        box.add(PresetView(
                          presetModel1: preset[i - 1],
                          presetModel2: preset[i],
                          leftGradient: colorGradient.elementAt(colorCounter++),
                          rightGradient:
                              colorGradient.elementAt(colorCounter++),
                        ));
                      } else {
                        box.add(PresetView1(
                          presetModel: preset[i],
                          leftGradient: colorGradient.elementAt(colorCounter++),
                        ));
                      }
                    }
                    counter += 1;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 100),
                child: Column(children: box),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
