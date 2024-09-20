import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moneyexpense/app/db/model/expense_by_category.dart';
import 'package:moneyexpense/app/db/repo/category.dart';
import 'package:moneyexpense/app/db/repo/expense.dart';
import 'package:moneyexpense/app/db/table/expense/expense.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<OnMainReset>(_onReset);
    on<OnMainReload>(_onReload);
    on<OnMainInit>(_onInit);
  }

  void _onReset(var event, var emit) {}

  void _onReload(var event, var emit) {}

  void _onInit(var event, var emit) async {
    emit(MainLoading());
    try {
      await LocalCategory.sync();

      var expenses = await LocalExpense.all();
      var today = await LocalExpense.today(expenses);
      var yesterday = await LocalExpense.yesterday(expenses);
      var amountToday = await LocalExpense.amountToday(today);
      var amountThisMonth = await LocalExpense.amountThisMonth(expenses);
      var expensesByCategory = await LocalExpense.byCategory(expenses);
      emit(MainSuccess(
        expenses: expenses,
        amountToday: amountToday,
        amountThisMonth: amountThisMonth,
        today: today,
        yesterday: yesterday,
        expensesByCategory: expensesByCategory,
      ));
    } catch (e) {
      emit(MainError());
    }
  }
}
