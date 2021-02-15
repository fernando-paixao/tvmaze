import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsityChallenge/components/season/season_episode_item.dart';
import 'package:jobsityChallenge/components/season/show_season_item.dart';
import 'package:jobsityChallenge/models/season_episode.dart';
import 'package:jobsityChallenge/models/show_season.dart';
import 'package:jobsityChallenge/services/api.dart';

import '../../styles.dart';

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

  Widget _getToogleShowEpisodesWidget() {
    String buttonText = showEpisodes ? "Hide Episodes" : "Show Episodes";
    IconData buttonIcon =
        showEpisodes && isLoaded ? Icons.visibility_off : Icons.visibility;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          buttonText,
          style: Theme.of(context).textTheme.button,
        ),
        Icon(buttonIcon)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Styles.mediumGray),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              ShowSeasonItem(widget.showSeason),
              InkWell(
                splashColor: Colors.grey,
                hoverColor: Colors.grey,
                focusColor: Colors.grey,
                highlightColor: Colors.grey,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        child: _getToogleShowEpisodesWidget(),
                        width: 120,
                      ),
                    )),
                onTap: () {
                  setState(() {
                    showEpisodes = !showEpisodes;
                  });
                  if (!isLoaded) _loadEpisodes();
                },
              ),
            ]),
          ),
        ),
      ),
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
