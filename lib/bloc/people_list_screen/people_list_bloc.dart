import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jobsityChallenge/models/person.dart';
import 'package:jobsityChallenge/services/api.dart';

part 'people_list_event.dart';
part 'people_list_state.dart';

class PeopleListBloc extends Bloc<PeopleListEvent, PeopleListState> {
  PeopleListBloc() : super(PeopleListLoading());

  @override
  Stream<PeopleListState> mapEventToState(
    PeopleListEvent event,
  ) async* {
    if (event is RetrieveFilteredList) {
      yield* _retrieveFilteredList(event);
    }
  }

  @override
  void onTransition(Transition<PeopleListEvent, PeopleListState> transition) {
    super.onTransition(transition);
    print('${transition.currentState} -- ${transition.nextState}');
  }

  Stream<PeopleListState> _retrieveFilteredList(
      RetrieveFilteredList event) async* {
    yield PeopleListLoading();

    String search = event.searchString;
    List<Person> peoplesFiltered = await Api().getPeopleFiltered(search);
    if (peoplesFiltered != null && peoplesFiltered.length > 0) {
      await Future.delayed(Duration(milliseconds: 300));
      yield PeopleFilteredListLoaded(peoplesFiltered);
    } else {
      yield PeopleListEmpty();
    }
  }
}
