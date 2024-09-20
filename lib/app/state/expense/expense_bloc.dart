import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:moneyexpense/app/db/repo/category.dart';
import 'package:moneyexpense/app/db/table/category/category.dart';
import 'package:moneyexpense/app/helper/extension/string_ext.dart';

part 'expense_event.dart';

part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final conName = TextEditingController();
  final conCategory = TextEditingController();
  final conDate = TextEditingController();
  final conNominal = TextEditingController();

  ExpenseBloc() : super(ExpenseInitial()) {
    on<OnExpenseInit>(_onInit);
    on<OnExpenseChangeCategory>(_onChangeCategory);
  }

  Future<void> _onInit(var event, var emit) async {
    emit(ExpenseLoading());
    try {
      var categories = await LocalCategory.all();
      var indexCategory = 0;
      conCategory.text = categories[indexCategory].name.toCapitalized();
      emit(ExpenseSuccess(
        categories: categories,
        indexCategory: indexCategory,
      ));
    } catch (e) {
      emit(ExpenseError());
    }
  }

  void _onChangeCategory(OnExpenseChangeCategory event, var emit) {
    final state = this.state;
    if (state is ExpenseSuccess) {
      var index = event.index;
      conCategory.text = state.categories[index].name.toCapitalized();
      emit(state.copy(
        indexCategory: index,
      ));
    }
  }
}
