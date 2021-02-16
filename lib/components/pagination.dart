import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsityChallenge/bloc/show_list_screen/show_list_bloc.dart';

import '../styles.dart';

class Pagination extends StatelessWidget {
  final int page;
  final int itemsLength;

  Pagination(this.page, this.itemsLength);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * Styles.getSizeFactor("big") / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (page > 0)
              ? RaisedButton(
                  child: Row(
                    children: [
                      Icon(Icons.navigate_before),
                      Text(
                        "Previous",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ],
                  ),
                  color: Styles.lightGray,
                  onPressed: () {
                    BlocProvider.of<ShowListBloc>(context)
                        .add(RetrieveList(page: page - 1));
                  },
                )
              : SizedBox(),
          if (itemsLength != 0)
            RaisedButton(
              child: Row(
                children: [
                  Text(
                    "Next",
                    style: Theme.of(context).textTheme.button,
                  ),
                  Icon(Icons.navigate_next),
                ],
              ),
              color: Styles.lightGray,
              onPressed: () {
                BlocProvider.of<ShowListBloc>(context)
                    .add(RetrieveList(page: page + 1));
              },
            )
        ],
      ),
    );
  }
}
