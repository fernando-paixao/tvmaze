part of 'show_list_bloc.dart';

//put equatable to compare in bloc test

abstract class ShowListState extends Equatable {}

class ShowListEmpty extends ShowListState {
  @override
  List<Object> get props => ["ShowListEmpty"];
}

class ShowListLoading extends ShowListState {
  @override
  List<Object> get props => ["ShowListLoading"];
}

class ShowListLoaded extends ShowListState {
  final List<Show> updatedShowList;
  int page;

  ShowListLoaded(this.updatedShowList, this.page);
  @override
  List<Object> get props {
    List<String> props = ["ShowListLoaded", this.page.toString()];
    props.addAll(this.updatedShowList.map((e) => e.name).toList());
    return props;
  }
}

class ShowFilteredListLoaded extends ShowListState {
  ShowFilteredListLoaded(this.updatedShowList);

  final List<Show> updatedShowList;
  @override
  List<Object> get props {
    List<String> props = ["ShowListLoaded"];
    props.addAll(this.updatedShowList.map((e) => e.name).toList());
    return props;
  }
}

class ShowListError extends ShowListState {
  @override
  List<Object> get props => ["ShowListError"];
}
