import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/contollers/news_controller.dart';


class SearchWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController(),);
    final search = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(children: [
        Expanded(child: TextField(
          onChanged: (value) {
            if(value.trim().isEmpty){
              newsController.getNewsForYou();
            }
          },
controller: search,
          decoration: InputDecoration(
            hintText: "Search news ...",
            fillColor: Theme.of(context).colorScheme.primaryContainer,
            border: InputBorder.none,
          ),
        ),),
       Obx(
       ()=>newsController.isNewsForYouLoading.value?Container(
         padding: const EdgeInsets.all(10),
         height: 50,
         width: 50,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: Theme.of(context).colorScheme.primary,
         ),
         child: CircularProgressIndicator(
           color: Colors.white,
         ),
       ): InkWell(
                onTap: (){
                  newsController.searchNews(search.text);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child:  Icon(Icons.search),
                ),
              ),
       ),
      ],),
    );
  }
}
