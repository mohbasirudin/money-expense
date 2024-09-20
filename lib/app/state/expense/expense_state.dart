part of 'expense_bloc.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseSuccess extends ExpenseState {
  final List<CategoryData> categories;
  final int indexCategory;
  final String expenseDate;
  final bool enabled;

  const ExpenseSuccess({
    this.categories = const [],
    this.indexCategory = 0,
    this.expenseDate = "",
    this.enabled = false,
  });

  ExpenseSuccess copy({
    var categories,
    var indexCategory,
    var expenseDate,
    var enabled,
  }) {
    return ExpenseSuccess(
      categories: categories ?? this.categories,
      indexCategory: indexCategory ?? this.indexCategory,
      expenseDate: expenseDate ?? this.expenseDate,
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        categories,
        indexCategory,
        expenseDate,
        enabled,
      ];
}

class ExpenseError extends ExpenseState {}
