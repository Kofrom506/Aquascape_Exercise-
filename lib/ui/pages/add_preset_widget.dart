import 'dart:ui';
import 'package:aquascape_exercise/ui/widgets/preset_view.dart';
import 'package:flutter/material.dart';
import 'package:aquascape_exercise/model/preset_model.dart';
import 'package:aquascape_exercise/ui/widgets/preset_view.dart';
// import 'package:aquascape_exercise/ui/widgets/preset_view.dart';

class AddPresetWidget extends StatefulWidget {
  @override
  State<AddPresetWidget> createState() => _MyAddPresetWidgetState();
}

class _MyAddPresetWidgetState extends State<AddPresetWidget> {
  List<Widget> box = [];
  List<PresetModel> preset = [];
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 30, top: 30),
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
                    preset.add(
                        PresetModel(presetName: "Preset" + counter.toString()));

                    for (int i = 0; i < counter; i++) {
                      if ((i + 1) % 2 == 0) {
                        box.removeLast();
                        box.add(PresetView(
                            presetModel1: preset[i - 1],
                            presetModel2: preset[i]));
                        // i+=1;
                      } else {
                        box.add(PresetView1(presetModel: preset[i]));
                      }
                    }
                    counter += 1;
                  });
                },
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.red,
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 100),
          child: Column(children: box),
        ),
      ],
    );
  }
}
