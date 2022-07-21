import 'package:aquascape_exercise/shared/theme.dart';
import 'package:flutter/material.dart';

import '../pages/about_page.dart';

class AqualedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AqualedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20),
      child: Row(
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
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/about-page');
            },
            child: Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/setting.png'),
                      fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 100);
}
