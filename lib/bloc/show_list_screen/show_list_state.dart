part of 'show_list_bloc.dart';

abstract class ShowListState {}

class ShowListEmpty extends ShowListState {}

class ShowListLoading extends ShowListState {}

class ShowListLoaded extends ShowListState {
  final List<Show> updatedShowList;
  int page;

  ShowListLoaded(this.updatedShowList, this.page);
}

class ShowFilteredListLoaded extends ShowListState {
  ShowFilteredListLoaded(this.updatedShowList);

  final List<Show> updatedShowList;
}

class ShowListError extends ShowListState {}
