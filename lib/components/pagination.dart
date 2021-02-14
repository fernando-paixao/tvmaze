import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsityChallenge/bloc/show_list_screen/show_list_bloc.dart';

class Pagination extends StatelessWidget {
  final int page;
  final int itemsLength;

  Pagination(this.page, this.itemsLength);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Text("Paginator: "),
        if (page > 0)
          RaisedButton(
            child: Text("Previous"),
            onPressed: () {
              BlocProvider.of<ShowListBloc>(context)
                  .add(RetrieveList(page: page - 1));
            },
          ),
        if (itemsLength != 0)
          RaisedButton(
            child: Text("Next"),
            onPressed: () {
              BlocProvider.of<ShowListBloc>(context)
                  .add(RetrieveList(page: page + 1));
            },
          )
      ],
    );
  }
}