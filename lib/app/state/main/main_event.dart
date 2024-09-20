part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnMainInit extends MainEvent {}

class OnMainReset extends MainEvent {}

class OnMainReload extends MainEvent {}

class OnMain extends MainEvent {}
