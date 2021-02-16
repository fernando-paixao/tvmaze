import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobsityChallenge/models/show.dart';
import 'package:jobsityChallenge/services/api.dart';

part 'show_list_event.dart';
part 'show_list_state.dart';

class ShowListBloc extends Bloc<ShowListEvent, ShowListState> {
  ShowListBloc() : super(ShowListLoading());

  @override
  Stream<ShowListState> mapEventToState(
    ShowListEvent event,
  ) async* {
    if (event is RetrieveList) {
      yield* _retrieveList(event);
    } else if (event is RetrieveFilteredList) {
      yield* _retrieveFilteredList(event);
    }
  }

  @override
  void onTransition(Transition<ShowListEvent, ShowListState> transition) {
    super.onTransition(transition);
    print('${transition.currentState} -- ${transition.nextState}');
  }

  Stream<ShowListState> _retrieveList(RetrieveList event) async* {
    yield ShowListLoading();

    List<Show> showsFiltered = await Api().getShows(page: event.page);
    if (showsFiltered != null && showsFiltered.length > 0) {
      await Future.delayed(Duration(milliseconds: 300));
      yield ShowListLoaded(showsFiltered, event.page);
    } else {
      yield ShowListEmpty();
    }
  }

  Stream<ShowListState> _retrieveFilteredList(
      RetrieveFilteredList event) async* {
    yield ShowListLoading();

    String search = event.searchString;
    List<Show> showsFiltered = await Api().getShowsFiltered(search);
    if (showsFiltered != null && showsFiltered.length > 0) {
      await Future.delayed(Duration(milliseconds: 300));
      yield ShowFilteredListLoaded(showsFiltered);
    } else {
      yield ShowListEmpty();
    }
  }
}
