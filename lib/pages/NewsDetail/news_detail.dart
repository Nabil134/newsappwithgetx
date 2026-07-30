import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/contollers/news_controller.dart';
import 'package:news_app/news_model.dart';

class NewsDetail extends StatelessWidget {
   NewsDetail({super.key,required this.articles});
  final Articles articles;
NewsController newsController = Get.put(NewsController(),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              /*first portion start here*/
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  child: Row(children: [
                    Icon(Icons.arrow_back_ios),
                    Text("Back"),
                  ],),
                ),
              ),
              /*first portion end here*/
              const SizedBox(height: 30,),
              /*second portion start here*/
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
               ),
               child: Row(children: [
                 Expanded(
                   child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.network(articles.urlToImage??"https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg",fit: BoxFit.cover,
                       errorBuilder: (context, error, stackTrace) => SizedBox(
                         height: 200,
                         width: 200,
                         child: Center(child: Icon(Icons.error_outline,color: Colors.red,size: 20,),),
                       ),
                       ),),),
               ],),
             ),
              /*second portion end here*/
              const SizedBox(height: 20,),
              /*third portion start here*/
              Text(articles.title??"No Title",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              /*third portion end here*/
                const SizedBox(height: 10,),
                /*four portion start here*/
                Row(
                  children: [
                    Text(articles.author??"Unknown",style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
                /*four portion end here*/
                const SizedBox(height: 10,),
                /*five portion start here*/
                Row(children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.red,
                    child: Text((articles.author?.isNotEmpty??false)?
                      articles!.author![0]:"NAN",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Text(articles.author??"Unknown",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),),
                  ),
                ],),
                /*five portion end here*/
                const SizedBox(height: 10,),
                /*six portion start here*/
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                  Obx(() =>IconButton(onPressed: () async {
                    if(newsController.isSpeak.value){
                   await   newsController.stop();
                    }
                    else{
                   await   newsController.speak(articles.description??"No Description");
                    }
                  }, icon: Icon(newsController.isSpeak.value?Icons.stop:Icons.play_arrow_rounded),),
                  ),
                    Flexible(child: Obx(()=> Lottie.asset("assets/animations/wave.json",height: 80,animate: newsController.isSpeak.value)),),
                  ],),
                ),
                /*six portion end here*/
                const SizedBox(height: 10,),
                /*seven portion start here*/
                Text(articles.description??"No Description",style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),),
                /*seven portion end here*/

            ],),
          ),
        ),
      ),
    );
  }
}
