class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel(
    this.id,
    this.title,
    this.image,
  );

  factory PosterModel.fromMapJson(Map<String, dynamic> jsonObject) =>
      PosterModel(
        jsonObject['id'],
        jsonObject['title'],
        jsonObject['image'],
      );
}
