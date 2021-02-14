import 'dart:convert';

import 'package:http/http.dart';
import 'package:jobsityChallenge/models/season_episode.dart';
import 'package:jobsityChallenge/models/show.dart';
import 'package:jobsityChallenge/models/show_season.dart';
import 'package:jobsityChallenge/services/api_requester.dart';

class Api {
  static const int MAX_QTD_PER_PAGE = 250; //250 max per page

  ApiRequester apiRequester;

  Api({this.apiRequester}) {
    //if (apiRequester == null) {
    //  apiRequester = ApiRequester();
    //}
    apiRequester = apiRequester ?? ApiRequester();
  }

  //Response shows = await api.getShows();

  getShows({int page = 0}) async {
    Response showsResponse = await apiRequester.getShows(page: page);
    List<dynamic> shows = json.decode(showsResponse.body);
    return shows.map((e) => Show.fromJson(e)).take(MAX_QTD_PER_PAGE).toList();
  }

  getShowsFiltered(String search) async {
    Response showsFilteredResponse = await apiRequester.getShowsSearch(search);
    List<dynamic> showsFiltered = json.decode(showsFilteredResponse.body);
    return showsFiltered
        .map((e) => Show.fromJson(e))
        //.take(QTD_PER_PAGE)
        .toList();
  }

  getShowSeasons(String showId) async {
    Response showSeasonsResponse = await apiRequester.getShowSeasons(showId);
    List<dynamic> showSeasons = json.decode(showSeasonsResponse.body);
    return showSeasons.map((e) => ShowSeason.fromJson(e)).toList();
  }

  getSeasonEpisodes(String seasonId) async {
    Response seasonEpisodesResponse =
        await apiRequester.getSeasonEpisodes(seasonId);
    List<dynamic> seasonsEpisodes = json.decode(seasonEpisodesResponse.body);
    return seasonsEpisodes.map((e) => SeasonEpisode.fromJson(e)).toList();
  }
}
