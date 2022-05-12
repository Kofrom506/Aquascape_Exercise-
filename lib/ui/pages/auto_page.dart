import 'package:aquascape_exercise/shared/theme.dart';
import 'package:flutter/material.dart';

class AutoPage extends StatefulWidget {
  const AutoPage({Key? key}) : super(key: key);

  @override
  _AutoPageState createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
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
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: [Text('ini satu'), Text('ini dua')],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: cBlackColor,
      body: Container(
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
                          fontSize: 22, fontWeight: bold, letterSpacing: 0.35),
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
