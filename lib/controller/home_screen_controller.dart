import 'package:get/get.dart';
import 'package:tech_media/component/api_constant.dart';
import 'package:tech_media/models/article_model.dart';
import 'package:tech_media/models/poster_model.dart';
import 'package:tech_media/services/dio_service.dart';

class HomeScreenController extends GetxController {
  //یک کنترلر درست میکنیم از تمام اجزای صفحه HomeScreen که با controller بهشون دسترسی داشته باشیم
  // و di رو رعایت کنیم
  late Rx<PosterModel> poster;
  RxList tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PosterModel> topPodcasts = RxList();

  //زمانی که این controller برای من init میشه که بتونم تووش کال بکنم و getHomeItems رو میگیریم
  @override
  onInit(){
    super.onInit();
    getHomeItems();
  }

  //این متد زیر برای اینه که variable های بالا رو برامون از سرور بگیره و پر بکنه و
  // چون میخواد از سرور بگیره کار زمان بره و async میخواد
  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    // میخواین با استفاده از response یی که داریم List هامون رو پر بکنیم
    //  یعنی به هر item از List دسترسی داشته باشیم با استفاده از for ech
    //البته قبلش باید چک بکنیم که status code درست بوده یا غلط

    if (response.statusCode == 200) {
      //میخوایم top_visited براساس هر خونه ش یا element ش بگیریم
      // و بریزیم توی topVisitedList و این لیست م با نوع ArticleModel مشخص شده
      // پس میتونیم لیست topVisitedList رو از ArticleModel های مختلف پر بکنیم
      //و الان میتونیم لیست مون رو توی view از این controller  بگیریم
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromMapJson(element));
      });
    }
  }
}
