import 'dart:ui';
import 'package:aquascape_exercise/cubit/select_preset_cubit.dart';
import 'package:aquascape_exercise/shared/theme.dart';
import 'package:aquascape_exercise/ui/widgets/preset_view.dart';
import 'package:flutter/material.dart';
import 'package:aquascape_exercise/model/preset_model.dart';
import 'package:aquascape_exercise/ui/widgets/preset_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    //PRESETLENGTH + 1 WILL BE A PROBLEM IF 'DELETE PRESET' IMPLEMENTED
                    preset.add(PresetModel(
                        id: (preset.length + 1).toString(),
                        presetName:
                            "Preset " + (preset.length + 1).toString()));

                    for (int i = 0; i < preset.length; i++) {
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
                child: BlocBuilder<SelectPresetCubit, String>(
                  builder: (context, state) {
                    return Column(children: box);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
