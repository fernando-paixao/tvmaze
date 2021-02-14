class SeasonEpisode {
  String id;
  String name;
  String number;
  String imageUrl;
  String summary;

  SeasonEpisode({
    this.id,
    this.name,
    this.number,
    this.imageUrl,
    this.summary,
  });

  factory SeasonEpisode.fromJson(Map<String, dynamic> json) {
    String imageType = "original"; //original,medium
    String image = (json["image"] != null) ? json["image"][imageType] : null;

    return SeasonEpisode(
      id: json["id"].toString(),
      name: json["name"],
      number: json["number"].toString(),
      imageUrl: image,
      summary: json["summary"],
    );
  }
}
