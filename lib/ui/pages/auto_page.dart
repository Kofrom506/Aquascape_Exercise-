import 'package:aquascape_exercise/cubit/bluetooth_cubit.dart';
import 'package:aquascape_exercise/cubit/preset_list_cubit.dart';
import 'package:aquascape_exercise/model/bluetooth_model.dart';
import 'package:aquascape_exercise/shared/theme.dart';
import 'package:aquascape_exercise/ui/pages/bluetooth_page.dart';
import 'package:aquascape_exercise/ui/pages/manual_page.dart';
import 'package:aquascape_exercise/ui/widgets/aqualed_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:aquascape_exercise/ui/pages/add_preset_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoPage extends StatefulWidget {
  const AutoPage({Key? key}) : super(key: key);
  @override
  _AutoPageState createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> with TickerProviderStateMixin {
  TabController? _tabController;
  bool refreshPage = true;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    context.read<PresetListCubit>().init();
    context.read<BluetoothCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            height: 447,
            padding: EdgeInsets.only(top: 30),
            child: TabBarView(
              controller: _tabController,
              children: [
                ManualPage(),
                AddPresetWidget(),
              ],
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: cBlackColor,
        appBar: AqualedAppBar(),
        body: ListView(children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                BlocConsumer<BluetoothCubit, BluetoothModel>(
                  listener: (context, state) {
                    print('bluetooth id:' + state.bluetoothId);
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        height: 76,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Status:',
                                  style: WhiteFont.copyWith(fontWeight: bold),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  context
                                          .watch<BluetoothCubit>()
                                          .isConnectedAlready
                                      ? 'Connected'
                                      : 'Not Connected',
                                  style: WhiteFont,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.circle_rounded,
                                  size: 17,
                                  color: cGreenColor,
                                ),
                              ],
                            ),
                            context.watch<BluetoothCubit>().isConnectedAlready
                                ? Text(
                                    state.bluetoothId,
                                    style: WhiteFont,
                                  )
                                : SizedBox()
                          ],
                        ),
                        decoration: BoxDecoration(
                            gradient: secondaryGradient,
                            borderRadius: BorderRadius.circular(defaultRadius)),
                      ),
                      onTap: () {
                        // context
                        //     .read<BluetoothCubit>()
                        //     .setCurrentBluetooth(new BluetoothModel());
                        print('bluetooth id:' + state.bluetoothId);
                        Navigator.pushNamed(context, '/bluetooth-page')
                            .then((_) => context.read<BluetoothCubit>().init());
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                tabBar(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  CircleTabIndicator({required this.color, required this.radius});
  //override createBoxPainter

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}
