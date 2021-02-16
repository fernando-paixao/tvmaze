import 'package:http/http.dart';
import 'package:jobsityChallenge/constants/tv_maze_constants.dart';
import 'package:http/http.dart' as http;

class ApiRequester {
  String baseUrl;

  ApiRequester({this.baseUrl = TvMazeConstants.BASE_URL});

  Future<Response> getShows({int page = 0}) async {
    String url = '$baseUrl${TvMazeConstants.SHOWS_ROUTE_PAGINATED(page)}';
    return await http.get(url);
  }

  Future<Response> getShow(String showId) async {
    String url = '$baseUrl${TvMazeConstants.SHOW_ROUTE(showId)}';
    return await http.get(url);
  }

  Future<Response> getShowsSearch(String queryString) async {
    String url = '$baseUrl${TvMazeConstants.SEARCH_SHOWS_ROUTE(queryString)}';
    return await http.get(url);
  }

  Future<Response> getPeopleSearch(String queryString) async {
    String url = '$baseUrl${TvMazeConstants.SEARCH_PEOPLE_ROUTE(queryString)}';
    return await http.get(url);
  }

  Future<Response> getPerson(String personId) async {
    String url = '$baseUrl${TvMazeConstants.PERSON_ROUTE(personId)}';
    return await http.get(url);
  }

  Future<Response> getPersonCast(String personId) async {
    String url = '$baseUrl${TvMazeConstants.PERSON_CAST_SHOWS_ROUTE(personId)}';
    return await http.get(url);
  }

  Future<Response> getShowCast(String showId) async {
    String url = '$baseUrl${TvMazeConstants.SEARCH_SHOW_CAST_ROUTE(showId)}';
    return await http.get(url);
  }

  Future<Response> getShowSeasons(String showId) async {
    String url = '$baseUrl${TvMazeConstants.SHOW_SEASONS_ROUTE(showId)}';
    return await http.get(url);
  }

  Future<Response> getSeasonEpisodes(String seasonId) async {
    String url = '$baseUrl${TvMazeConstants.SHOW_EPISODES_ROUTE(seasonId)}';
    return await http.get(url);
  }
}
