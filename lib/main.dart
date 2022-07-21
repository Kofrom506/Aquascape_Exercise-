import 'package:aquascape_exercise/cubit/preset_list_cubit.dart';
import 'package:aquascape_exercise/cubit/select_preset_cubit.dart';
import 'package:aquascape_exercise/ui/pages/about_page.dart';
import 'package:aquascape_exercise/ui/pages/bluetooth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/pages/auto_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectPresetCubit()),
        BlocProvider(create: (context) => PresetListCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => AutoPage(),
          '/bluetooth-page': (context) => BluetoothPage(),
          '/about-page': (context) => AboutPage(),
        },
      ),
    );
  }
}
//sdsdsdsdsda
