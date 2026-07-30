import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/NewsTileLoading.dart';
import 'package:news_app/components/TrandingLoadingCard.dart';
import 'package:news_app/contollers/news_controller.dart';
import 'package:news_app/pages/homePage/Widgets/tranding_card.dart';
import 'package:news_app/utils/app_string.dart';

import '../NewsDetail/news_detail.dart';
import 'Widgets/news_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController(),);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                /*first portion start here*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(Icons.dashboard),
                    ),
                    const   Text(AppString.appName,style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),),
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.person),
                      ),
                    ),
                  ],),
                /*first portion end here*/
                const SizedBox(height: 40,),
                /*second portion start here*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.hottestNews,style: Theme.of(context).textTheme.bodyLarge),
                    Text(AppString.seeAll,style: Theme.of(context).textTheme.labelSmall),
                  ],),
                /*second portion end here*/
                const SizedBox(height: 20,),
                /*third portion start here*/
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:Obx(
                        ()=> newsController.isTrandingLoading.value?Row(
                      children: [
                        TrandingLoadingCard(),
                        TrandingLoadingCard(),
                      ],
                    ): Row(children: newsController.trandingNewsList.map((e) => TrandingCard(tag: e!.source!.id??"", time: e.publishedAt!, imageUrl: e.urlToImage!, title: e.title!, author:e.author!, onTap: (){
                      Get.to(NewsDetail(articles: e),);
                    }),).toList(),),
                  ),),

                /*third portion end here*/
                const SizedBox(height: 20,),
                /*four portion start here*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.newsForYou,style: Theme.of(context).textTheme.bodyLarge),
                    Text(AppString.seeAll,style: Theme.of(context).textTheme.labelSmall),
                  ],),
                /*four portion end here*/
                const SizedBox(height: 20,),
                /*five portion start here*/
                newsController.isNewsForYouLoading.value?Column(
                  children: [
                    NewsTileLoading(),
                    NewsTileLoading(),
                    NewsTileLoading(),
                  ],
                ):
                ListView.builder(
                    itemCount: newsController.newsForYou5.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = newsController.newsForYou5[index];
                      return NewsTile(imageUrl: item.urlToImage??"https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg", title: item!.title??"No Title", time: item!.publishedAt!, author: item!.author??"Unknown", onTap: (){
                        Get.to(NewsDetail(articles: item),);
                      });
                    }
                ), /*five portion end here*/
                const SizedBox(height: 40,),
                /*six portion start here*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.teslaNews,style: Theme.of(context).textTheme.bodyLarge),
                    Text(AppString.seeAll,style: Theme.of(context).textTheme.labelSmall),
                  ],),
                /*six portion end here*/
                const SizedBox(height: 20,),
                /*seven portion start here*/
                newsController.isTeslaNewsLoading.value?Column(
                  children: [
                    NewsTileLoading(),
                    NewsTileLoading(),
                    NewsTileLoading(),
                  ],
                ):
                ListView.builder(
                    itemCount: newsController.teslaNewsList5.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = newsController.teslaNewsList5[index];
                      return NewsTile(imageUrl: item.urlToImage??"https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg", title: item!.title??"No Title", time: item!.publishedAt!, author: item!.author??"Unknown", onTap: (){
                        Get.to(NewsDetail(articles: item),);
                      });
                    }
                ), /*seven portion end here*/
                const SizedBox(height: 40,),
                /*eight portion start here*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.appleNews,style: Theme.of(context).textTheme.bodyLarge),
                    Text(AppString.seeAll,style: Theme.of(context).textTheme.labelSmall),
                  ],),
                /*eight portion end here*/
                const SizedBox(height: 20,),
                /*nine portion start here*/
                newsController.isAppleNewsLoading.value?Column(
                  children: [
                    NewsTileLoading(),
                    NewsTileLoading(),
                    NewsTileLoading(),
                  ],
                ):
                ListView.builder(
                    itemCount: newsController.appleNewsList5.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = newsController.appleNewsList5[index];
                      return NewsTile(imageUrl: item.urlToImage??"https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg", title: item!.title??"No Title", time: item!.publishedAt!, author: item!.author??"Unknown", onTap: (){
                        Get.to(NewsDetail(articles: item),);
                      });
                    }
                ), /*nine portion end here*/
                const SizedBox(height: 40,),
                /*ten portion start here*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.businessNews,style: Theme.of(context).textTheme.bodyLarge),
                    Text(AppString.seeAll,style: Theme.of(context).textTheme.labelSmall),
                  ],),
                /*ten portion end here*/
                const SizedBox(height: 20,),
                /*last portion start here*/
                newsController.isBusinessNewsLoading.value?Column(
                  children: [
                    NewsTileLoading(),
                    NewsTileLoading(),
                    NewsTileLoading(),
                  ],
                ):
                ListView.builder(
                    itemCount: newsController.businessNewsList5.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = newsController.businessNewsList5[index];
                      return NewsTile(imageUrl: item.urlToImage??"https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg", title: item!.title??"No Title", time: item!.publishedAt!, author: item!.author??"Unknown", onTap: (){
                        Get.to(NewsDetail(articles: item),);
                      });
                    }
                ), /*last portion end here*/
              ],),
          ),
        ),
      ),
    );
  }
}


