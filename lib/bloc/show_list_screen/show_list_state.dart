part of 'show_list_bloc.dart';

abstract class ShowListState {
  /*final List<Show> currentShowList;
  final int page;

  const ShowListState({this.currentShowList, this.page});*/
}

class ShowListEmpty extends ShowListState {}

class ShowListLoading extends ShowListState {}

class ShowListLoaded extends ShowListState {
  final List<Show> updatedShowList;
  int page;

  ShowListLoaded(this.updatedShowList, this.page);
  //: super(currentShowList: updatedShowList, page: page);
}

class ShowFilteredListLoaded extends ShowListState {
  ShowFilteredListLoaded(this.updatedShowList);
  //: super(currentShowList: updatedShowList);

  final List<Show> updatedShowList;
}

class ShowListError extends ShowListState {}
