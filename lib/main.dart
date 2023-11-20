// ignore_for_file: unnecessary_import, depend_on_referenced_packages, implementation_imports

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gastrack/page/homePage.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

//page
import 'coverpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(GetMaterialApp(
    theme: customTheme,
    builder: EasyLoading.init(),
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
    routes: <String, WidgetBuilder>{
      '/main': (BuildContext context) => const MyApp(),
      '/cover': (BuildContext context) => const Coverpage(),
      '/home': (BuildContext context) => const Home(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      EasyLoading.show();
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: (SpUtil.getBool('agen', defValue: false)!
              ? const Home()
              : const Coverpage()),
          type: PageTransitionType.fade,
        ),
      );

      EasyLoading.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(249, 1, 131, 1.0),
              Color.fromRGBO(128, 38, 198, 1.0)
            ], // Warna gradient
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/icon/logo_white.png",
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}

final ThemeData customTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromRGBO(249, 1, 131, 1.0),
    ),
  ),
);
