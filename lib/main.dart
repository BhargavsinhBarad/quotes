import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/Views/Screens/details_page.dart';
import 'package:quotes/Views/Screens/home_page.dart';
import 'package:quotes/Views/Screens/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Views/Screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isvisited = preferences.getBool("isIntroVisited") ?? false;
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: (isvisited) ? 'Splash' : '/',
      routes: {
        '/': (ctx) => intro_page(),
        'Splash': (ctx) => Splash(),
        'home_page': (ctx) => home_page(),
        'details': (ctx) => details(),
      },
    ),
  );
}
