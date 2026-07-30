import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/LoadingContainer.dart';

class NewsTileLoading extends StatelessWidget {
  const NewsTileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(children: [
        LoadingContainer(height: 120,width: 120,),
        const SizedBox(width: 10,),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            LoadingContainer(height: 20, width: 20),
            const SizedBox(width: 10,),
            Expanded(child: LoadingContainer(height: 10, width: double.infinity),),
          ],),
            const SizedBox(height: 15,),
            LoadingContainer(height: 10, width: double.infinity),
            const SizedBox(height: 15,),
            LoadingContainer(height: 10, width: double.infinity),
        ],)),
      ],),
    );
  }
}
