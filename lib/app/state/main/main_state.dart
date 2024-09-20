part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainSuccess extends MainState {
  final List<ExpenseData> expenses;
  final num amountToday;
  final num amountThisMonth;
  final List<ExpenseData> today;
  final List<ExpenseData> yesterday;

  const MainSuccess({
    this.expenses = const [],
    this.amountToday = 0,
    this.amountThisMonth = 0,
    this.today = const [],
    this.yesterday = const [],
  });

  MainSuccess copy({
    var expenses,
    var amountToday,
    var amountThisMonth,
    var today,
    var yesterday,
  }) {
    return MainSuccess(
      expenses: expenses ?? this.expenses,
      amountToday: amountToday ?? this.amountToday,
      amountThisMonth: amountThisMonth ?? this.amountThisMonth,
      today: today ?? this.today,
      yesterday: yesterday ?? this.yesterday,
    );
  }

  @override
  List<Object?> get props => [
        expenses,
        amountToday,
        amountThisMonth,
        today,
        yesterday,
      ];
}

class MainError extends MainState {}
