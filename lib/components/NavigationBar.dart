import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/contollers/bottom_nav_controller.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController(),);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap:(){
                  controller.index.value=0;
                },
                child: Obx(() => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: controller.index.value==0? Theme.of(context).colorScheme.primary:null,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Icon(Icons.home,
                      size: 20,
                      color: controller.index.value==0? Theme.of(context).colorScheme.onBackground:Theme.of(context).colorScheme.secondaryContainer,),
                  ),
                ),),
              ),
              InkWell(
                onTap: (){
controller.index.value=1;
                },
                child:Obx(() =>  AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: controller.index.value==1? Theme.of(context).colorScheme.primary:null,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Icon(Icons.book,
                      size: 20,
                      color:controller.index.value==1? Theme.of(context).colorScheme.onBackground:Theme.of(context).colorScheme.secondaryContainer),
                  ),
                ),),
              ),
              InkWell(
                onTap: (){
                  controller.index.value=2;
                },
                child: Obx(() => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color:controller.index.value==2? Theme.of(context).colorScheme.primary:null,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Icon(Icons.settings,
                        size: 20,
                        color:controller.index.value==2? Theme.of(context).colorScheme.onBackground:Theme.of(context).colorScheme.secondaryContainer),
                  ),
                ),),
              ),
            ],),
        ),
      ],
    );
  }
}
