class TvMazeConstants {
  static const String BASE_URL = 'http://api.tvmaze.com';
  static const String SHOWS_ROUTE = '/shows'; //URL_LOAD
  static const String SEASONS_ROUTE = '/seasons';

  static String SEARCH_SHOWS_ROUTE(String term) =>
      '/search/shows?q=$term'; //URL_SEARCH
  static String SEARCH_SHOW_CAST_ROUTE(String id) =>
      '$SHOWS_ROUTE/$id?embed=cast'; //URL_SEARCH_CAST
  static String SHOW_SEASONS_ROUTE(String id) =>
      '$SHOWS_ROUTE/$id/seasons'; //URL_SEASONS
  static String SHOW_EPISODES_ROUTE(String id) =>
      '$SEASONS_ROUTE/$id/episodes'; //URL_EPISODES
}
