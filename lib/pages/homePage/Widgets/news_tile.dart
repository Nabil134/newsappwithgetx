import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.author,
    required this.onTap,
  });
final String imageUrl;
  final String title;
  final String time;
  final String author;
final  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(children: [
          Container(
            width: 120,
            height:120,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child:   ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imageUrl,fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) => Container(  width: 120,
                height:120,child: Icon(Icons.error_outline_outlined,color: Colors.red,),),),),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 10,),
                    Flexible(child: Text(author,maxLines: 1,),),
                  ],),
                const SizedBox(height: 15,),
                Text(title,maxLines: 2,),
                const SizedBox(height: 15,),
                Text(time,style: Theme.of(context).textTheme.labelSmall,),
              ],),
          ),
        ],),
      ),
    );
  }
}