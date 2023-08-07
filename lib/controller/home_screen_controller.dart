import 'package:get/get.dart';
import 'package:tech_media/component/api_constant.dart';
import 'package:tech_media/models/poster_model.dart';
import 'package:tech_media/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;
  RxList tagsList = RxList();
  RxList topVisitedList = RxList();
  RxList topPodcasts = RxList();

  getHomeItems() async{
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    response.data['poster'];
    response.data['top_visited'];
    response.data['top_podcasts'];
    response.data['tags'];
  }



}