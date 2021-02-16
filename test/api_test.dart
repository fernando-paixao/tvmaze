import 'package:jobsityChallenge/models/person.dart';
import 'package:jobsityChallenge/services/api.dart';

void main() async {
  var api = Api();

  var show = await api.getShow("1");
  var people = await api.getPeopleFiltered("Mike Vogel");
  Person person = people[0];
  var personCastShows = await api.getPeopleCast(person.id);
  var shows = await api.getShows(page: 50);
  var showsFiltered = await api.getShowsFiltered("Supernatural");
  var showSeasons = await api.getShowSeasons(showsFiltered[0].id);
  var seasonEpisodes = await api.getSeasonEpisodes(showSeasons[0].id);

  print(showsFiltered.toString() +
      shows.toString() +
      seasonEpisodes.toString() +
      personCastShows.toString() +
      show.toString());
}
