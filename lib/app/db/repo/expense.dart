import 'package:drift/drift.dart';
import 'package:moneyexpense/app/db/model/expense_by_category.dart';
import 'package:moneyexpense/app/db/table/expense/expense.dart';
import 'package:moneyexpense/app/helper/extension/string_ext.dart';
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
        var date = Func.formatter(data[i].date);
        var before = Func.formatter(
          DateTime.now().subtract(const Duration(days: 1)).toString(),
        );
        print("yesterday: $date, $before");
        if (date == before) newData.add(data[i]);
      }
      return newData;
    } catch (e) {
      return [];
    }
  }

  static Future<List<ItemExpenseByCategory>> byCategory(
    List<ExpenseData> data,
  ) async {
    try {
      var items = <ItemExpenseByCategory>[];
      var categories = <String>[];
      for (var i = 0; i < data.length; i++) {
        categories.add(data[i].categoryName);
      }
      print("cat b: $categories");

      categories = categories.toSet().toList();
      print("cat a: $categories");

      for (var i = 0; i < categories.length; i++) {
        // var cItems = <ItemExpenseByCategory>[];
        num nominal = 0;
        var icon = "", color = "";
        for (var n = 0; n < data.length; n++) {
          var cCategory = categories[i].lower();
          var eCategory = data[n].categoryName.lower();
          if (cCategory == eCategory) {
            nominal = nominal + num.parse(data[n].nominal);
            icon = data[n].categoryIcon;
            color = data[n].categoryColor;
          }
        }
        var item = ItemExpenseByCategory(
          name: categories[i],
          icon: icon,
          color: color,
          amount: nominal,
        );
        items.add(item);
      }

      print("items: ${items.length}");

      return items;
    } catch (e) {
      return [];
    }
  }
}
