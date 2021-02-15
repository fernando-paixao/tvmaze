import 'package:jobsityChallenge/services/api.dart';

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
    String image =
        (json["image"] != null) ? json["image"][Api.IMAGE_QUALITY_KEY] : null;

    return SeasonEpisode(
      id: json["id"].toString(),
      name: json["name"],
      number: json["number"].toString(),
      imageUrl: image,
      summary: json["summary"],
    );
  }
}
