part of 'people_list_bloc.dart';

abstract class PeopleListState {}

class PeopleListEmpty extends PeopleListState {}

class PeopleListLoading extends PeopleListState {}

class PeopleFilteredListLoaded extends PeopleListState {
  PeopleFilteredListLoaded(this.updatedPeopleList);

  final List<Person> updatedPeopleList;
}

class PeopleListError extends PeopleListState {}
