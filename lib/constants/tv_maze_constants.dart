class TvMazeConstants {
  static const String BASE_URL = 'http://api.tvmaze.com';
  static const String SHOWS_ROUTE = '/shows'; //URL_LOAD
  static const String SEASONS_ROUTE = '/seasons';
  static const String PEOPLE_ROUTE = '/people';

  static String SHOWS_ROUTE_PAGINATED(int page) => '$SHOWS_ROUTE?page=$page';
  static String SEARCH_SHOWS_ROUTE(String term) => '/search/shows?q=$term';
  static String SEARCH_PEOPLE_ROUTE(String term) => '/search/people?q=$term';
  static String PERSON_ROUTE(String id) => '$PEOPLE_ROUTE/$id';
  static String PERSON_CAST_SHOWS_ROUTE(String id) =>
      '$PEOPLE_ROUTE/$id/castcredits?embed=show';
  static String SHOW_ROUTE(String id) => '$SHOWS_ROUTE/$id';
  static String SEARCH_SHOW_CAST_ROUTE(String id) =>
      '$SHOWS_ROUTE/$id?embed=cast';
  static String SHOW_SEASONS_ROUTE(String id) => '$SHOWS_ROUTE/$id/seasons';
  static String SHOW_EPISODES_ROUTE(String id) => '$SEASONS_ROUTE/$id/episodes';
}
