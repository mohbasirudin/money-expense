import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:moneyexpense/app/db/repo/category.dart';
import 'package:moneyexpense/app/db/repo/expense.dart';
import 'package:moneyexpense/app/db/table/category/category.dart';
import 'package:moneyexpense/app/helper/extension/string_ext.dart';
import 'package:moneyexpense/app/helper/func/func.dart';

part 'expense_event.dart';

part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final conName = TextEditingController();
  final conCategory = TextEditingController();
  final conDate = TextEditingController();
  final conNominal = TextEditingController();

  ExpenseBloc() : super(ExpenseInitial()) {
    on<OnExpenseInit>(_onInit);
    on<OnExpenseReset>(_onReset);
    on<OnExpenseReload>(_onReload);
    on<OnExpenseChangeName>(_onChangeName);
    on<OnExpenseChangeCategory>(_onChangeCategory);
    on<OnExpenseChangeDate>(_onChangeDate);
    on<OnExpenseChangeNominal>(_onChangeNominal);
    on<OnExpenseSave>(_onSave);
  }

  void _onReset(var event, var emit) {
    conName.clear();
    conCategory.clear();
    conDate.clear();
    conNominal.clear();

    emit(ExpenseInitial());
  }

  void _onReload(var event, var emit) {
    final state = this.state;
    if (state is ExpenseSuccess) {
      conName.clear();
      conDate.clear();
      conNominal.clear();

      var categories = state.categories;
      var indexCategory = 0;
      conCategory.text = categories[indexCategory].name.toCapitalized();

      emit(state.copy(
        indexCategory: indexCategory,
        enabled: false,
        expenseDate: "",
      ));
    }
  }

  Future<void> _onInit(var event, var emit) async {
    emit(ExpenseLoading());
    try {
      var categories = await LocalCategory.all();
      if (categories.isEmpty) {
        await LocalCategory.sync();
        categories = await LocalCategory.all();
      }
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

  bool isEnabled() {
    return conName.text.isNotEmpty &&
        conCategory.text.isNotEmpty &&
        conDate.text.isNotEmpty &&
        conNominal.text.isNotEmpty;
  }

  void _onChangeName(var event, var emit) {
    final state = this.state;
    if (state is ExpenseSuccess) {
      emit(state.copy(enabled: isEnabled()));
    }
  }

  void _onChangeCategory(OnExpenseChangeCategory event, var emit) {
    final state = this.state;
    if (state is ExpenseSuccess) {
      var index = event.index;
      conCategory.text = state.categories[index].name.toCapitalized();
      emit(state.copy(
        indexCategory: index,
        enabled: isEnabled(),
      ));
    }
  }

  void _onChangeDate(OnExpenseChangeDate event, var emit) {
    final state = this.state;
    if (state is ExpenseSuccess) {
      var value = event.value;
      conDate.text = Func.formatter(
        value,
        newFormat: "EEEE, dd MMMM yyyy",
      );

      emit(state.copy(
        expenseDate: value,
        enabled: isEnabled(),
      ));
    }
  }

  void _onChangeNominal(var event, var emit) {
    final state = this.state;
    if (state is ExpenseSuccess) {
      emit(state.copy(enabled: isEnabled()));
    }
  }

  void _onSave(OnExpenseSave event, var emit) async {
    final state = this.state;
    if (state is ExpenseSuccess) {
      var categories = state.categories;
      var indexCategory = state.copy().indexCategory;
      var result = await LocalExpense.add(
        name: conName.text,
        date: state.copy().expenseDate,
        nominal: conNominal.text.currency(),
        categoryName: categories[indexCategory].name,
        categoryIcon: categories[indexCategory].icon,
        categoryColor: categories[indexCategory].color,
      );
      event.onCallback(result);
    }
  }
}
