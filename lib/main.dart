import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/Views/Screens/home_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: home_page(),
    ),
  );
}
