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

  const ExpenseSuccess({
    this.categories = const [],
    this.indexCategory = 0,
  });

  ExpenseSuccess copy({
    var categories,
    var indexCategory,
  }) {
    return ExpenseSuccess(
      categories: categories ?? this.categories,
      indexCategory: indexCategory ?? this.indexCategory,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        categories,
        indexCategory,
      ];
}

class ExpenseError extends ExpenseState {}
