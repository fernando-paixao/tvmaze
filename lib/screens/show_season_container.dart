import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsityChallenge/components/season_episode_item.dart';
import 'package:jobsityChallenge/components/show_season_item.dart';
import 'package:jobsityChallenge/models/season_episode.dart';
import 'package:jobsityChallenge/models/show_season.dart';
import 'package:jobsityChallenge/services/api.dart';

class ShowSeasonContainer extends StatefulWidget {
  final ShowSeason showSeason;

  ShowSeasonContainer(this.showSeason);

  @override
  _ShowSeasonContainerState createState() => _ShowSeasonContainerState();
}

class _ShowSeasonContainerState extends State<ShowSeasonContainer> {
  bool isLoaded;
  bool showEpisodes;
  List<SeasonEpisode> episodes;

  void _loadEpisodes() async {
    episodes = await Api().getSeasonEpisodes(widget.showSeason.id);
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    isLoaded = false;
    showEpisodes = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      ShowSeasonItem(widget.showSeason),
      RaisedButton(
        child: Text("See episodes"),
        onPressed: () {
          setState(() {
            showEpisodes = !showEpisodes;
          });
          if (!isLoaded) {
            _loadEpisodes();
          }
        },
      )
    ];
    if (isLoaded && showEpisodes) {
      var episodeItems = List.generate(
        episodes.length,
        (index) => SeasonEpisodeItem(episodes.elementAt(index)),
      );
      list.addAll(episodeItems);
    } else if (!isLoaded && showEpisodes) {
      list.add(Text("Loading Episodes"));
    }

    return Column(
      children: list,
    );
  }
}
