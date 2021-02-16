import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsityChallenge/components/schedule.dart';
import 'package:jobsityChallenge/components/summary.dart';
import 'package:jobsityChallenge/models/show.dart';

import '../image_container.dart';

class ShowItemDetailed extends StatefulWidget {
  final Show show;

  ShowItemDetailed(this.show);

  @override
  _ShowItemDetailedState createState() => _ShowItemDetailedState();
}

class _ShowItemDetailedState extends State<ShowItemDetailed> {
  bool isFavorite;

  _load() async {
    bool widgetshowIsFavorite = await widget.show.isFavorite();
    setState(() {
      isFavorite = widgetshowIsFavorite;
    });
  }

  _toogleFavorite() async {
    if (isFavorite)
      await widget.show.unsetFavorite();
    else if (!isFavorite) await widget.show.setFavorite();

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isFavorite != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              InkWell(
                onTap: _toogleFavorite,
                child: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : null,
                ),
              )
            ],
          ),
        if (widget.show.imageUrl != null) ImageContainer(widget.show.imageUrl),
        Text(
          widget.show.name,
          style: Theme.of(context).textTheme.headline3,
        ),
        if (widget.show.genres.isNotEmpty) Text(widget.show.genres.join(", ")),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Summary(widget.show.summary),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
          child: Schedule(widget.show),
        ),
      ],
    );
  }
}
