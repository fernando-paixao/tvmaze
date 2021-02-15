import 'package:jobsityChallenge/services/api.dart';

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
    String image =
        (json["image"] != null) ? json["image"][Api.IMAGE_QUALITY_KEY] : null;

    return ShowSeason(
      id: json["id"].toString(),
      name: json["name"],
      number: json["number"].toString(),
      imageUrl: image,
      summary: json["summary"],
    );
  }
}
