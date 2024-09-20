part of 'expense_bloc.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnExpenseInit extends ExpenseEvent {}

class OnExpenseChangeCategory extends ExpenseEvent {
  final int index;

  const OnExpenseChangeCategory(this.index);
}

class OnExpenseChangeDate extends ExpenseEvent {
  final String value;

  const OnExpenseChangeDate(this.value);
}

class OnExpenseChangeName extends ExpenseEvent {}

class OnExpenseChangeNominal extends ExpenseEvent {}

class OnExpenseReset extends ExpenseEvent {}
