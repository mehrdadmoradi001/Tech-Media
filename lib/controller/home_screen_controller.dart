import 'package:get/get.dart';
import 'package:tech_media/component/api_constant.dart';
import 'package:tech_media/models/article_model.dart';
import 'package:tech_media/models/podcast_model.dart';
import 'package:tech_media/models/poster_model.dart';
import 'package:tech_media/models/tags_model.dart';
import 'package:tech_media/services/dio_service.dart';

//یک کنترلر درست میکنیم از تمام اجزای صفحه HomeScreen که با controller بهشون دسترسی داشته باشیم
// و di رو رعایت کنیم
class HomeScreenController extends GetxController {
  //متغیر poster رو مقداردهی اولیه میکنیم و همچمنین observable
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcasts = RxList();
  //میخوایم تا وقتی که null یه لودینگ نشونمون بده و وقتی متغیرها مقداردهی شدن بیا صفحه رو نشون بده
  RxBool loading = false.obs;

  //زمانی که این controller برای من init میشه که بتونم تووش کال بکنم و getHomeItems رو میگیریم
  @override
  onInit(){
    super.onInit();
    getHomeItems();
  }

  //این متد زیر برای اینه که variable های بالا رو برامون از سرور بگیره و پر بکنه و
  // چون میخواد از سرور بگیره کار زمان بره و async میخواد
  getHomeItems() async {
    //وقتی متد getHomeItems اجرا میشه لودینگ true باشه
    loading.value = true;
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

      response.data['top_podcasts'].forEach((element) {
        topPodcasts.add(PodcastModel.fromMapJson(element));
      });

      //از این طریق لیست تگ هارو پر میکنیم
      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromMapJson(element));
      });


      //میخوایم poster رو مقدار دهی بکنیم که بتونیم توی view بهش دسترسی داشته باشیم.
      //میخوام کلید PosterModel رو که poster هست رو با fromJson که یه دیتا map بگیریم
      poster.value = PosterModel.fromJson(response.data['poster']);

      //وقتی هم که شرط اجرا شد و همه قبلی ها اجرا شد بیاد لودینگ false بشه چون مبخوایم توی ui ازش استفاده بکنم
      loading.value = false;

    }
  }
}
