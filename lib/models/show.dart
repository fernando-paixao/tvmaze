class Show {
  String id;
  String name;
  String imageUrl;
  List<String> genres;
  String summary;
  String scheduleTime;
  List<String> scheduleDays;

  //"image": {
  //  "medium": "http://static.tvmaze.com/uploads/images/medium_portrait/105/263741.jpg",

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

    String imageType = "original"; //original,medium
    String image =
        (showJson["image"] != null) ? showJson["image"][imageType] : null;
    //String images = [ ["image"][imageType] ];
/*
Name
Poster
Days and time during which the series airs
Genres
Summary
List of episodes separated by season
*/
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
}
