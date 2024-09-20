part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainSuccess extends MainState {}

class MainError extends MainState {}
