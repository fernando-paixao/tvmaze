import 'dart:convert';

import 'package:http/http.dart';
import 'package:jobsityChallenge/services/api_requester.dart';

void main() async {
  var apiRequester = ApiRequester();

  Response showsResponse = await apiRequester.getShows();
  var shows = json.decode(showsResponse.body);

  Response showsFilteredResponse =
      await apiRequester.getShowsSearch("Supernatural");
  var showsFiltered = json.decode(showsFilteredResponse.body);
  var show = showsFiltered[0]["show"];

  Response showCastResponse =
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
  var episode = episodes[0];

  print(episode.toString() + showCastForReal.toString() + shows.toString());
}
