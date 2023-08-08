import 'package:tech_media/component/api_constant.dart';

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;

  // String? isFavorite;
  String? createdAt;

  ArticleModel(
    this.id,
    this.title,
    this.image,
    this.catId,
    this.catName,
    this.author,
    this.view,
    this.status,
    // this.isFavorite,
    this.createdAt,
  );

  factory ArticleModel.fromMapJson(Map<String, dynamic> jsonObject) =>
      ArticleModel(
          jsonObject['id'],
          jsonObject['title'],
          ApiConstant.hostDlUrl + jsonObject['image'],
          jsonObject['cat_id'],
          jsonObject['cat_name'],
          jsonObject['author'],
          jsonObject['view'],
          jsonObject['status'],
          jsonObject['created_at']);
}
