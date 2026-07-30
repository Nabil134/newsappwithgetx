import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/contollers/news_controller.dart';
import 'package:news_app/pages/ArticalPage/widgets/search_widget.dart';
import 'package:news_app/pages/NewsDetail/news_detail.dart';

import '../homePage/Widgets/news_tile.dart';

class ArticalPage extends StatelessWidget {
  ArticalPage({super.key});
NewsController controller = Get.put(NewsController(),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(children: [
              SearchWidget(),
              const SizedBox(height: 20,),
              Obx(
                  ()=> ListView.builder(
                  itemCount:controller.newsForYou.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item= controller.newsForYou[index];
                    return NewsTile(imageUrl: item!.urlToImage??"", title: item!.title??"No Title", time: item!.publishedAt??"Not Known", author: item!.author??"No Author", onTap: (){
                      Get.to(NewsDetail(articles:item),);
                    });
                  }

                ),
              ),
            ],),
          ),
        ),
      ),
    );
  }
}
