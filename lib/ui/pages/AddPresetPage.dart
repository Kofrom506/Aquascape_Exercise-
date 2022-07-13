import 'package:aquascape_exercise/model/preset_model.dart';
import 'package:aquascape_exercise/model/schedule_model.dart';
import 'package:aquascape_exercise/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:aquascape_exercise/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AddPresetPage extends StatefulWidget {
  @override
  _AddPresetPageState createState() => _AddPresetPageState();
}

class _AddPresetPageState extends State<AddPresetPage> {
  //preset name controller
  final TextEditingController presetNameController =
      TextEditingController(text: '');

  //Create preset instance
  PresetModel preset = new PresetModel();

  //Assign preset schedule list into new list to make it a state object
  // List<ScheduleModel>? schedules = preset.schedules;

  String presetName = 'Name';

//BELUM ASSIGN PRESET NAME KE PRESET MODEL
  @override
  void initState() {
    presetNameController.addListener(() {
      //use setState to rebuild the widget
      setState(() {
        presetName = presetNameController.text;
        preset.presetName = presetName;
      });
    });
    super.initState();
  }

  iosDatePicker(BuildContext context, int index, bool isStartActive) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                SizedBox(
                  height: 180,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (value) => setState(() => isStartActive
                        ? (preset.schedules![index].startActive = value)
                        : (preset.schedules![index].endActive = value)),
                    initialDateTime: DateTime.now(),
                  ),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                child: Text('Done'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBlackColor,
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 32),
              Container(
                child: Text(
                  'Edit Preset',
                  style: WhiteFont.copyWith(fontSize: 22, fontWeight: bold),
                ),
              ),
              Container(
                width: double.infinity,
                height: 153,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  color: cGreyColor,
                ),
                margin: EdgeInsets.only(top: 19),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: cDarkGreyColor,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/pencil.png'),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          presetName,
                          style: WhiteFont.copyWith(
                              fontSize: 22, fontWeight: bold),
                        )
                      ],
                    ),
                    CustomTextFormField(
                        hintText: 'your preset name',
                        controller: presetNameController)
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.only(top: 32, bottom: 21),
                  color: cGreyColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadius)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: cDarkGreyColor,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/clock.png'),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Schedule',
                            style: WhiteFont.copyWith(
                                fontSize: 22, fontWeight: bold),
                          )
                        ],
                      ),
                      ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return Slidable(
                            key: Key(index.toString()),
                            endActionPane: ActionPane(
                                dismissible: DismissiblePane(
                                  onDismissed: () {
                                    setState(() {
                                      preset.schedules!.removeAt(index);
                                    });
                                  },
                                ),
                                extentRatio: 0.25,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    label: "delete",
                                    backgroundColor: Colors.white,
                                    icon: Icons.delete,
                                    onPressed: (context) {
                                      setState(() {
                                        preset.schedules!.removeAt(index);
                                      });
                                    },
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius),
                                  ),
                                ]),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 27, vertical: 17),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'from',
                                        style: WhiteFont.copyWith(fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                          onTap: () => iosDatePicker(
                                              context, index, true),
                                          child: Text(
                                            DateFormat('hh:mm a').format(preset
                                                .schedules![index].startActive),
                                            style: WhiteFont.copyWith(
                                                fontSize: 19,
                                                fontWeight: medium),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 28,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Intensity',
                                        style: WhiteFont.copyWith(
                                            fontSize: 14, fontWeight: bold),
                                      ),
                                      Text(
                                        '${preset.schedules![index].startIntensity.round()}%',
                                        style: WhiteFont.copyWith(
                                            fontSize: 12, fontWeight: medium),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Slider(
                                      value: preset
                                          .schedules![index].startIntensity,
                                      min: 0,
                                      max: 100,
                                      divisions: 100,
                                      activeColor: cLightOrange,
                                      onChanged: (value) => setState(() =>
                                          preset.schedules![index]
                                                  .startIntensity =
                                              value.roundToDouble())),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'to',
                                        style: WhiteFont.copyWith(fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                          onTap: () => iosDatePicker(
                                              context, index, false),
                                          child: Text(
                                            DateFormat('hh:mm a').format(preset
                                                .schedules![index].endActive),
                                            style: WhiteFont.copyWith(
                                                fontSize: 19,
                                                fontWeight: medium),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 28,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Intensity',
                                        style: WhiteFont.copyWith(
                                            fontSize: 14, fontWeight: bold),
                                      ),
                                      Text(
                                        '${preset.schedules![index].endIntensity.round()}%',
                                        style: WhiteFont.copyWith(
                                            fontSize: 12, fontWeight: medium),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Slider(
                                      value:
                                          preset.schedules![index].endIntensity,
                                      min: 0,
                                      max: 100,
                                      divisions: 100,
                                      activeColor: cLightOrange,
                                      onChanged: (value) => setState(() =>
                                          preset.schedules![index]
                                                  .endIntensity =
                                              value.roundToDouble())),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          height: 2,
                          color: Colors.black54,
                          thickness: 1,
                          indent: 27,
                          endIndent: 27,
                        ),
                        padding: const EdgeInsets.all(8),
                        itemCount: preset.schedules!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: GestureDetector(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: cDarkGreyColor,
                                borderRadius:
                                    BorderRadius.circular(defaultRadius)),
                            child: Icon(
                              Icons.add,
                              size: 36,
                              color: cWhiteColor,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              preset.schedules!.add(ScheduleModel());
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 47,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: secondaryGradient,
                    borderRadius: BorderRadius.circular(defaultRadius)),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: WhiteFont.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    )),
              )
            ],
          ),
        ),
      ]),
    );
    //
  }
}
