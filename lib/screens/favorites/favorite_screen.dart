import 'package:flutter/material.dart';
import 'package:jobsityChallenge/components/show/show_item.dart';
import 'package:jobsityChallenge/models/show.dart';
import 'package:jobsityChallenge/repository/favorite_shows_repository.dart';
import 'package:jobsityChallenge/screens/empty_list.dart';
import 'package:jobsityChallenge/services/api.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool isLoaded;
  List<Show> favoriteShows;

  _load() async {
    Api api = Api();
    var favoriteShowsId = await FavoriteShowsRepository().getAll();
    if (favoriteShowsId.length > 0) {
      favoriteShows = [];
      for (String id in favoriteShowsId) {
        favoriteShows.add(await api.getShow(id));
      }
      //Iterable<Future<dynamic>> intermed = await favoriteShowsId
      //    .map((e) async => await api.getShow(e.toString()));
      //print("dude");
    }
    //favoriteShows = await favoriteShowsId
    //  .map((e) => Future.wait(api.getShow(e.toString())))
    //intermed.toList()
    //.cast<Show>();
    else
      favoriteShows = [];
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    isLoaded = false;
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Text("Your favorites shows here"),
    ];
    if (isLoaded && favoriteShows.length > 0) {
      var showsItems = List.generate(
        favoriteShows.length,
        (index) => ShowItem(favoriteShows.elementAt(index)),
      );
      list.addAll(showsItems);
    } else if (isLoaded == false) {
      list.add(Text("Loading"));
    } else {
      list.add(EmptyList());
    }

    return ListView(
      children: list,
    );
  }
}
