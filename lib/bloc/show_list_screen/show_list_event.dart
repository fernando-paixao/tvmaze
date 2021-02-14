part of 'show_list_bloc.dart';

abstract class ShowListEvent {
  //extends Equatable
  const ShowListEvent();
}

//Translate
//Os EVENTOS do BLoC ficarão aqui, com regras de quais parâmetros serão expostos para a BLoC

class RetrieveList extends ShowListEvent {
  //@override
  //List<Object> get props => throw UnimplementedError();
}

class RetrieveFilteredList extends ShowListEvent {
  String searchString;

  RetrieveFilteredList(this.searchString);

  //@override
  //List<Object> get props => throw UnimplementedError();
}
