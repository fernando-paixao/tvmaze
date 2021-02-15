import 'package:jobsityChallenge/services/api.dart';

class Person {
  String id;
  String name;
  String imageUrl;
  //List<String> genres;
  //String summary;
  //String scheduleTime;
  //List<String> scheduleDays;

  Person({
    this.id,
    this.name,
    this.imageUrl,
    //this.genres,
    //this.scheduleDays,
    //this.scheduleTime,
    //this.summary,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    var personJson = json["person"];

    String image = (personJson["image"] != null)
        ? personJson["image"][Api.IMAGE_QUALITY_KEY]
        : null;

    return Person(
      id: personJson["id"].toString(),
      name: personJson["name"],
      imageUrl: image,
      //genres: personJson["genres"].cast<String>(),
      //summary: personJson["summary"],
      //scheduleTime: personJson["schedule"]["time"],
      //scheduleDays: personJson["schedule"]["days"].cast<String>(),
    );
  }
}
