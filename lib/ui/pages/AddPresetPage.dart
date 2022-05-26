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
  final TextEditingController presetNameController =
      TextEditingController(text: '');

  final List<String> entries = <String>['A', 'B'];

  final List<int> colorCodes = <int>[600, 500, 100];

  DateTime chosenDateTime = DateTime.now();

  double value = 50;

  iosDatePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                SizedBox(
                  height: 180,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (value) =>
                        setState(() => chosenDateTime = value),
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
                              image: AssetImage('pencil.png'),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Name',
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
                                image: AssetImage('clock.png'),
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
                            key: Key(entries[index]),
                            endActionPane: ActionPane(
                                dismissible: DismissiblePane(
                                  onDismissed: () {
                                    setState(() {
                                      entries.removeAt(index);
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
                                        entries.removeAt(index);
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'from',
                                        style: WhiteFont.copyWith(fontSize: 13),
                                      ),
                                      GestureDetector(
                                          onTap: () => iosDatePicker(context),
                                          child: Text(
                                            DateFormat('hh:mm a')
                                                .format(chosenDateTime),
                                            style: WhiteFont.copyWith(
                                                fontSize: 20,
                                                fontWeight: medium),
                                          )),
                                      Text(
                                        'to',
                                        style: WhiteFont.copyWith(fontSize: 13),
                                      ),
                                      GestureDetector(
                                          onTap: () => iosDatePicker(context),
                                          child: Text(
                                            DateFormat('hh:mm a')
                                                .format(chosenDateTime),
                                            style: WhiteFont.copyWith(
                                                fontSize: 20,
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
                                            fontSize: 16, fontWeight: bold),
                                      ),
                                      Text(
                                        '${value}%',
                                        style: WhiteFont.copyWith(
                                            fontSize: 12, fontWeight: medium),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  SliderTheme(
                                    data: SliderThemeData(
                                        trackHeight: 55.13,
                                        inactiveTrackColor: cBlackColor,
                                        activeTickMarkColor: cWhiteColor,
                                        inactiveTickMarkColor: cWhiteColor,
                                        activeTrackColor: cLightOrange,
                                        thumbShape:
                                            SliderComponentShape.noThumb,
                                        tickMarkShape: RoundSliderTickMarkShape(
                                            tickMarkRadius: 2)),
                                    child: Slider(
                                        value: value,
                                        min: 0,
                                        max: 100,
                                        divisions: 5,
                                        onChanged: (value) =>
                                            setState(() => this.value = value)),
                                  ),
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
                        itemCount: entries.length,
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
                                // image: DecorationImage(
                                //     image: AssetImage('add-button.png'),
                                //     fit: BoxFit.cover
                                //     )
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
                              entries.add('Z');
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
