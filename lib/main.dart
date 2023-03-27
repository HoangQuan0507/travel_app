import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representation/routes.dart';
import 'package:travel_app/representation/screens/splash_screen.dart';

import 'core/constants/color_constants.dart';

void main() async{
  await Hive.initFlutter();
 // await LocalStorageHelper.initLocalStorageHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travo App',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        backgroundColor: ColorPalette.backgroundScaffoldColor ,
      ),
      routes: routes,
      onGenerateRoute: generateRoutes,
      home: const SplashScreen(),
    );
  }
}

