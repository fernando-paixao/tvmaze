class ShowSeason {
  String id;
  String name;
  String number;
  String imageUrl;
  String summary;

  ShowSeason({
    this.id,
    this.name,
    this.number,
    this.imageUrl,
    this.summary,
  });

  factory ShowSeason.fromJson(Map<String, dynamic> json) {
    String imageType = "original"; //original,medium
    String image = (json["image"] != null) ? json["image"][imageType] : null;

    return ShowSeason(
      id: json["id"].toString(),
      name: json["name"],
      number: json["number"].toString(),
      imageUrl: image,
      summary: json["summary"],
    );
  }
}
