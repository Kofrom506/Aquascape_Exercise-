import 'package:aquascape_exercise/cubit/select_preset_cubit.dart';
import 'package:aquascape_exercise/ui/pages/AddPresetPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/pages/auto_page.dart';
import 'ui/pages/manual_page.dart';
import 'ui/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectPresetCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => AutoPage(),
          // '/AddPresetPage': (context) => AddPresetPage(),
        },
      ),
    );
  }
}
