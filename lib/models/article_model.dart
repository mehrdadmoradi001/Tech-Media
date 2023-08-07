class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
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
    this.createdAt,
  );

  factory ArticleModel.fromMapJson(Map<String, dynamic> jsonObject) =>
      ArticleModel(
        jsonObject['id'],
        jsonObject['title'],
        jsonObject['image'],
        jsonObject['cat_id'],
        jsonObject['cat_name'],
        jsonObject['author'],
        jsonObject['view'],
        jsonObject['status'],
        jsonObject['created_at'],
      );
}
