import 'package:flutter/material.dart';

class TrandingCard extends StatelessWidget {
  const TrandingCard({super.key,required this.tag,required this.time,required this.imageUrl,required this.title,required this.author,required this.onTap});
  final String tag;
  final String time;
  final String imageUrl;
  final String title;
  final String author;
final  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.background,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imageUrl,fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tag,style: Theme.of(context).textTheme.labelSmall),
              Text(time,style: Theme.of(context).textTheme.labelSmall),
            ],),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 20),),
              ),
            ],),
          const SizedBox(height: 10,),
          Row(children: [
            const SizedBox(width: 10,),
            CircleAvatar(
              radius: 15,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(author[0],style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),),
            ),
            const SizedBox(width: 10,),
            Flexible(
              child: Text(author,
                maxLines: 1,
              ),
            ),

          ],),
        ],),
      ),
    );
  }
}
