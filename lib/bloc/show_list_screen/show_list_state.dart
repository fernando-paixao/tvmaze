part of 'show_list_bloc.dart';

abstract class ShowListState {
  //extends Equatable
  final List<Show> currentShowList; //List<Seed>
  final int page; //List<Seed>

  const ShowListState({this.currentShowList, this.page});
}

//Os ESTADOS do BLoC ficarão aqui, com regras de quais parâmetros serão expostos para a UI
//(Fernando Antônio) A lógica que uso 99% das vezes:
//1 - Nome do BLoC + Empty - Irá renderizar o estado vazio onde o BLoC ainda não foi chamado a processar algo
//2 - Nome do BLoC + Loading - Estado de espera entre qualquer operação do BLoC
//3 - Nome do BLoC + Loaded - Estado padrão para quando os dados forem carregados com sucesso
//4 - Nome do BLoC + Error - Estado de erro se o processamento falhar
class ShowListEmpty extends ShowListState {
  //@override
  //List<Object> get props => [];
}

class ShowListLoading extends ShowListState {
  //@override
  //List<Object> get props => [];
}

class ShowListLoaded extends ShowListState {
  ShowListLoaded(this.updatedShowList, this.page)
      : super(currentShowList: updatedShowList, page: page);

  final List<Show> updatedShowList; //List<Seed>
  int page;

  //@override
  List<Object> get props => [currentShowList, page];
}

class ShowFilteredListLoaded extends ShowListState {
  ShowFilteredListLoaded(this.updatedShowList)
      : super(currentShowList: updatedShowList);

  final List<Show> updatedShowList; //List<Seed>

  //@override
  List<Object> get props => [currentShowList];
}

class ShowListError extends ShowListState {
  //@override
  //List<Object> get props => [];
}
