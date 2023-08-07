class TagsModel {
  String? id;
  String? title;
  String? image;

  TagsModel(
      this.id,
      this.title,
      this.image,
      );

  factory TagsModel.fromMapJson(Map<String, dynamic> jsonObject) =>
      TagsModel(
        jsonObject['id'],
        jsonObject['title'],
        jsonObject['image'],
      );
}
