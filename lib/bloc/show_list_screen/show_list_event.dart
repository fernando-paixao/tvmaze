part of 'show_list_bloc.dart';

abstract class ShowListEvent {
  const ShowListEvent();
}

class RetrieveList extends ShowListEvent {
  int page;

  RetrieveList({this.page = 0});
}

class RetrieveFilteredList extends ShowListEvent {
  String searchString;

  RetrieveFilteredList(this.searchString);
}
