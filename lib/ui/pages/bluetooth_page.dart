import 'package:aquascape_exercise/shared/theme.dart';
import 'package:aquascape_exercise/ui/widgets/aqualed_app_bar.dart';
import 'package:flutter/material.dart';

class BluetoothPage extends StatelessWidget {
  const BluetoothPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AqualedAppBar(),
      backgroundColor: cBlackColor,
      //edit body nya yaa
      body: Text(
        'Ini page buat milih bluetooth',
        style: WhiteFont,
      ),
    ));
  }
}
