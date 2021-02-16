import 'package:jobsityChallenge/repository/favorite_shows_repository.dart';
import 'package:jobsityChallenge/services/api.dart';

class Show {
  String id;
  String name;
  String imageUrl;
  List<String> genres;
  String summary;
  String scheduleTime;
  List<String> scheduleDays;

  Show({
    this.id,
    this.name,
    this.imageUrl,
    this.genres,
    this.scheduleDays,
    this.scheduleTime,
    this.summary,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    var showJson = (json.containsKey("show")) ? json["show"] : json;

    String image = (showJson["image"] != null)
        ? showJson["image"][Api.IMAGE_QUALITY_KEY]
        : null;

    return Show(
      id: showJson["id"].toString(),
      name: showJson["name"],
      imageUrl: image,
      genres: showJson["genres"].cast<String>(),
      summary: showJson["summary"],
      scheduleTime: showJson["schedule"]["time"],
      scheduleDays: showJson["schedule"]["days"].cast<String>(),
    );
  }

  Future<bool> isFavorite() async {
    return await FavoriteShowsRepository().isInList(id);
  }

  Future<bool> setFavorite() async {
    return await FavoriteShowsRepository().addOne(id);
  }

  Future<bool> unsetFavorite() async {
    return await FavoriteShowsRepository().removeOne(id);
  }
}
