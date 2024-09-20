part of 'expense_bloc.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnExpenseInit extends ExpenseEvent{}
class OnExpense extends ExpenseEvent{}
