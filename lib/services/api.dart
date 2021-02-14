import 'dart:convert';

import 'package:http/http.dart';
import 'package:jobsityChallenge/models/show.dart';
import 'package:jobsityChallenge/services/api_requester.dart';

class Api {
  static const int QTD_PER_PAGE = 10;

  ApiRequester apiRequester;

  Api({this.apiRequester}) {
    //if (apiRequester == null) {
    //  apiRequester = ApiRequester();
    //}
    apiRequester = apiRequester ?? ApiRequester();
  }

  //Response shows = await api.getShows();

  getShows() async {
    Response showsResponse = await apiRequester.getShows();
    List<dynamic> shows = json.decode(showsResponse.body);
    return shows.map((e) => Show.fromJson(e)).take(QTD_PER_PAGE).toList();
  }

  getShowsFiltered(String search) async {
    Response showsFilteredResponse = await apiRequester.getShowsSearch(search);
    List<dynamic> showsFiltered = json.decode(showsFilteredResponse.body);
    return showsFiltered
        .map((e) => Show.fromJson(e))
        .take(QTD_PER_PAGE)
        .toList();
  }
}
