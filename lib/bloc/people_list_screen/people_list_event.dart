part of 'people_list_bloc.dart';

abstract class PeopleListEvent {
  const PeopleListEvent();
}

class RetrieveList extends PeopleListEvent {
  RetrieveList();
}

class RetrieveFilteredList extends PeopleListEvent {
  String searchString;

  RetrieveFilteredList(this.searchString);
}
