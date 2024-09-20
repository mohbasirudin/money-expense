import 'package:drift/drift.dart';
import 'package:moneyexpense/app/db/table/expense/expense.dart';
import 'package:moneyexpense/app/helper/func/func.dart';

class LocalExpense {
  static TbExpense? _tb;

  static Future<void> _init() async => _tb = TbExpense();

  static Future<bool> add({
    required String name,
    required String date,
    required String nominal,
    required String categoryName,
    required String categoryIcon,
    required String categoryColor,

  }) async {
    if (_tb == null) await _init();
    try {
      var data = ExpenseCompanion(
        name: Value(name),
        date: Value(date),
        nominal: Value(nominal),
        categoryName: Value(categoryName),
        categoryIcon: Value(categoryIcon),
        categoryColor: Value(categoryColor),

      );
      var result = await _tb!.create(data);
      return result;
    } catch (e) {
      return false;
    }
  }

  static Future<List<ExpenseData>> all() async {
    if (_tb == null) await _init();

    try {
      return _tb!.read();
    } catch (e) {
      return [];
    }
  }

  static Future<num> amountToday(List<ExpenseData> data) async {
    try {
      // var newData = <ExpenseData>[];
      // for (var i = 0; i < data.length; i++) {
      //   var date = Func.formatter(data[i].date);
      //   var today = Func.formatter(DateTime.now().toString());
      //   if (date == today) newData.add(data[i]);
      // }
      num amount = 0;
      for (var i = 0; i < data.length; i++) {
        amount = amount + num.parse(data[i].nominal);
      }
      return amount;
    } catch (e) {
      return 0;
    }
  }

  static Future<num> amountThisMonth(List<ExpenseData> data) async {
    try {
      var newData = <ExpenseData>[];
      for (var i = 0; i < data.length; i++) {
        var month = DateTime.parse(data[i].date).month;
        var thisMonth = DateTime.now().month;
        if (month == thisMonth) newData.add(data[i]);
      }
      num amount = 0;
      for (var i = 0; i < newData.length; i++) {
        amount = amount + num.parse(newData[i].nominal);
      }
      return amount;
    } catch (e) {
      return 0;
    }
  }

  static Future<List<ExpenseData>> today(
    List<ExpenseData> data,
  ) async {
    try {
      var newData = <ExpenseData>[];
      for (var i = 0; i < data.length; i++) {
        var date = Func.formatter(data[i].date);
        var today = Func.formatter(DateTime.now().toString());
        if (date == today) newData.add(data[i]);
      }
      return newData;
    } catch (e) {
      return [];
    }
  }

  static Future<List<ExpenseData>> yesterday(
    List<ExpenseData> data,
  ) async {
    try {
      var newData = <ExpenseData>[];
      for (var i = 0; i < data.length; i++) {
        var date = DateTime.parse(data[i].date);
        var before = DateTime.now().subtract(const Duration(days: 1));
        if (date == before) newData.add(data[i]);
      }
      return newData;
    } catch (e) {
      return [];
    }
  }
}
