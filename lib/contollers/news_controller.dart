import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import '../news_model.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController{
RxList<Articles> trandingNewsList=<Articles>[].obs;
RxList<Articles> newsForYou=<Articles>[].obs;
RxList<Articles> newsForYou5=<Articles>[].obs;
RxList<Articles> appleNewsList=<Articles>[].obs;
RxList<Articles> appleNewsList5=<Articles>[].obs;
RxList<Articles> teslaNewsList=<Articles>[].obs;
RxList<Articles> teslaNewsList5=<Articles>[].obs;
RxList<Articles> businessNewsList=<Articles>[].obs;
RxList<Articles> businessNewsList5=<Articles>[].obs;
RxBool isTrandingLoading= false.obs;
RxBool isNewsForYouLoading= false.obs;
RxBool isAppleNewsLoading= false.obs;
RxBool isTeslaNewsLoading= false.obs;
RxBool isBusinessNewsLoading= false.obs;
RxBool isSpeak= false.obs;
FlutterTts flutterTts = FlutterTts();
@override
  void onInit() {
    super.onInit();
    flutterTts.setCompletionHandler(() {
      isSpeak.value=false;
    });
    flutterTts.setCancelHandler(() {
      isSpeak.value=false;
    });
   flutterTts.setErrorHandler((message) {
     isSpeak.value=false;
   }) ;
    getTrandingNews();
    getNewsForYou();
    getTeslaNews();
    getAppleNews();
    getBusinessNews();
  }
/*getTrandingNews start here*/
  Future<void> getTrandingNews() async {
    isTrandingLoading=true.obs;
    var baseUrl="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
    try{
      var response = await http.get(Uri.parse(baseUrl),);
      print(response);
      if(response.statusCode==200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articles= body["articles"];
        for(var news in articles){
          trandingNewsList.add(Articles.fromJson(news),);
        }
        print("-----------------");
        print(trandingNewsList);
        print("-----------------");
      }
    else{
        print("Something went Wrong in Tranding News");
      }
    }
        catch(e){
print(e);
        }
        isTrandingLoading=false.obs;
  }
/*getTrandingNews start here*/
  /*getNewsForYou start here*/
  Future<void> getNewsForYou() async {
    isNewsForYouLoading=true.obs;
    var baseUrl="https://newsapi.org/v2/everything?domains=wsj.com&apiKey=21357b41e1934329970fbfdd4f4833f5";
    try{
      var response = await http.get(Uri.parse(baseUrl),);
      print(response);
      if(response.statusCode==200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articles= body["articles"];
        for(var news in articles){
          newsForYou.add(Articles.fromJson(news),);
        }
        newsForYou5.value=newsForYou.sublist(0,5);
        print("-----------------");
        print(newsForYou5);
        print("-----------------");


      }
      else{
        print("Something went Wrong in News For You");
      }
    }
        catch(e){
      print(e);
        }
    isNewsForYouLoading=false.obs;
  }
/*getNewsForYou end here*/
  /*getTeslaNews start here*/
  Future<void> getTeslaNews() async {
    isTeslaNewsLoading=true.obs;
    var baseUrl="https://newsapi.org/v2/everything?q=tesla&from=2026-06-28&sortBy=publishedAt&apiKey=21357b41e1934329970fbfdd4f4833f5";
    try{
      var response = await http.get(Uri.parse(baseUrl),);
      print(response);
      if(response.statusCode==200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articles= body["articles"];
        for(var news in articles){
          teslaNewsList.add(Articles.fromJson(news),);
        }
        teslaNewsList5.value=teslaNewsList.sublist(6,10);
        print("-----------------");
        print(teslaNewsList5);
        print("-----------------");


      }
      else{
        print("Something went Wrong in Tesla News");
      }
    }
    catch(e){
      print(e);
    }
    isTeslaNewsLoading=false.obs;
  }
  /*getTeslaNews end here*/
  /*getAppleNews start here*/
  Future<void> getAppleNews() async {
    isAppleNewsLoading=true.obs;
    var baseUrl="https://newsapi.org/v2/everything?domains=wsj.com&apiKey=21357b41e1934329970fbfdd4f4833f5";
    try{
      var response = await http.get(Uri.parse(baseUrl),);
      print(response);
      if(response.statusCode==200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articles= body["articles"];
        for(var news in articles){
          appleNewsList.add(Articles.fromJson(news),);
        }
        appleNewsList5.value=appleNewsList.sublist(0,5);
        print("-----------------");
        print(appleNewsList5);
        print("-----------------");


      }
      else{
        print("Something went Wrong in Apple News");
      }
    }
    catch(e){
      print(e);
    }
    isAppleNewsLoading=false.obs;
  }

/*getAppleNews end here*/
/*getBusinessNews start here*/
  Future<void> getBusinessNews() async {
    isBusinessNewsLoading=true.obs;
    var baseUrl="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=21357b41e1934329970fbfdd4f4833f5";
    try{
      var response = await http.get(Uri.parse(baseUrl),);
      print(response);
      if(response.statusCode==200){
        print(response.body);
        var body = jsonDecode(response.body);
        var articles= body["articles"];
        for(var news in articles){
          businessNewsList.add(Articles.fromJson(news),);
        }
        businessNewsList5.value=businessNewsList.sublist(0,5);
        print("-----------------");
        print(businessNewsList5);
        print("-----------------");


      }
      else{
        print("Something went Wrong in Business News");
      }
    }
    catch(e){
      print(e);
    }
    isBusinessNewsLoading=false.obs;
  }
/*getBusinessNews end here*/
/*searchNews start here*/
Future<void> searchNews(String search) async {
  isNewsForYouLoading.value=true;
  var baseUrl="https://newsapi.org/v2/everything?domains=wsj.com&q=$search&apiKey=21357b41e1934329970fbfdd4f4833f5";
  try{
    var response = await http.get(Uri.parse(baseUrl),);
    print(response);
    if(response.statusCode==200){
      print(response.body);
      var body = jsonDecode(response.body);
      var articles=body["articles"];
      newsForYou.clear();
      int i=0;
      for(var news in articles){
        i++;
newsForYou.add(Articles.fromJson(news),);
if(i==10){
  break;
}
      }
    }
    else{
      print("Something went Wrong in Search News");
    }
  }
  catch(e){
    print(e);
  }
  isNewsForYouLoading.value=false;
}
/*searchNews end here*/
/*speak start here*/
Future<void> speak(String text) async {
  isSpeak.value=true;
await flutterTts.setLanguage("en-US");
 await flutterTts.setPitch(1);
 await flutterTts.setSpeechRate(0.5);
 await flutterTts.speak(text);
}
/*speak end here*/
/*speak start here*/
  Future<void> stop()  async {
  await  flutterTts.stop();
    isSpeak.value=false;
  }
/*speak end here*/
}