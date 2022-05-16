import 'package:aquascape_exercise/shared/theme.dart';
import 'package:flutter/material.dart';
import '../decorator.dart';

class AutoPage extends StatefulWidget {
  const AutoPage({Key? key}) : super(key: key);
  @override
  _AutoPageState createState() => _AutoPageState();
}
class _AutoPageState extends State<AutoPage> with TickerProviderStateMixin {
  TabController? _tabController;
  //buat state nantinya
  double scheduleCount = 2;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget addSchedule() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        height: (scheduleCount == 1 && scheduleCount > 0)
            ? 290
            : 470 + 185 * (scheduleCount - 2),
        decoration: BoxDecoration(
            color: cGreyColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
      );
    }

    Widget tabBar() {
      return Column(
        children: [
          Container(
            child: TabBar(
              controller: _tabController,
              labelColor: cWhiteColor,
              labelPadding:
                  const EdgeInsets.only(bottom: 10, right: 20, left: 20),
              unselectedLabelColor: cManualGreyColor,
              isScrollable: true,
              indicator: CircleTabIndicator(color: cWhiteColor, radius: 3.5),
              tabs: [Text('Manual'), Text('Auto')],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: (scheduleCount == 1
                ? 447
                : 150 + 470 + 185 * (scheduleCount - 2)),
            padding: EdgeInsets.only(top: 30),
            child: TabBarView(
              controller: _tabController,
              children: [
                Text('ini satu'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Preset',
                      style: WhiteFont.copyWith(fontSize: 22, fontWeight: bold),
                    ),
                    addSchedule(),
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
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: cBlackColor,
      body: ListView(children: [
        Container(
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
              tabBar(),
            ],
          ),
        ),
      ]),
    );
  }
}
