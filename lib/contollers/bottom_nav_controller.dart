import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/pages/ArticalPage/artical_page.dart';
import 'package:news_app/pages/homePage/home_page.dart';

class BottomNavController extends GetxController{
  RxInt index= 0.obs;
  var pages=[
  const  HomePage(),
    ArticalPage(),
    const Center(child: Text("Profile Page"),),
  ];
}