import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/contollers/home_page_controller.dart';
import 'package:news_app/pages/homePage/home_page.dart';
import 'package:news_app/utils/app_string.dart';
import 'package:news_app/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
     theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePageController(),
    );
  }
}

