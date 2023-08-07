class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? createdAt;

  PodcastModel(
    this.id,
    this.title,
    this.poster,
    this.publisher,
    this.view,
    this.createdAt,
  );

  factory PodcastModel.fromMapJson(Map<String, dynamic> jsonObject) =>
      PodcastModel(
        jsonObject['id'],
        jsonObject['title'],
        jsonObject['poster'],
        jsonObject['publisher'],
        jsonObject['view'],
        jsonObject['created_at'],
      );
}
