import 'package:flutter/material.dart';
import 'package:news_app/components/LoadingContainer.dart';

class TrandingLoadingCard extends StatelessWidget {
  const TrandingLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
LoadingContainer(height: 200, width: double.infinity),
        const SizedBox(height: 10,),
 Row(
   children: [
   Flexible(
     flex: 3,
     child: LoadingContainer(height: 10),),
   const SizedBox(width: 10,),
   Flexible(
     flex: 2,
       child: LoadingContainer(height: 10),),
 ],),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Expanded(child: LoadingContainer(height: 20, width: MediaQuery.of(context).size.width/1.6),),
        ],),
        const SizedBox(height: 10,),
Row(children: [
  const SizedBox(width: 10,),
  LoadingContainer(height: 20, width: 20),
  const SizedBox(width: 10,),
  Expanded(child: LoadingContainer(height: 20, width: double.infinity),),
],),
        const SizedBox(height: 10,),
      ],
      ),
    );
  }
}
