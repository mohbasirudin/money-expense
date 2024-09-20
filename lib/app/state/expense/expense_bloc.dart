import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'expense_event.dart';

part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final conName = TextEditingController();
  final conCategory = TextEditingController();
  final conDate = TextEditingController();
  final conNominal = TextEditingController();

  ExpenseBloc() : super(ExpenseInitial()) {
    on<OnExpenseInit>(_onInit);
  }

  Future<void> _onInit(var event, var emit) async {
    emit(ExpenseLoading());
    try {
      emit(ExpenseSuccess());
    } catch (e) {
      emit(ExpenseError());
    }
  }
}
