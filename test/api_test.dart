import 'package:jobsityChallenge/services/api.dart';

void main() async {
  var api = Api();

  //var shows = await api.getShows();
  //var showsFiltered = await api.getShowsFiltered("Supernatural");
  var showsFiltered = json.decode(showsFilteredResponse.body);
  var show = showsFiltered[0]["show"];

  /*Response showCastResponse =
      await apiRequester.getShowCast(show["id"].toString());
  var showCast = json.decode(showCastResponse.body);
  var showCastForReal = showCast["_embedded"]["cast"];

  Response showSeasonsResponse =
      await apiRequester.getShowSeasons(show["id"].toString());
  var showSeasons = json.decode(showSeasonsResponse.body);
  var season = showSeasons[0];

  Response seasonEpisodesResponse =
      await apiRequester.getSeasonEpisodes(season["id"].toString());
  var episodes = json.decode(seasonEpisodesResponse.body);
  var episode = episodes[0];*/

  print(showsFiltered.toString() + shows.toString());
  print("Hellow");
}
