import 'package:drift/drift.dart';
import 'package:moneyexpense/app/db/table/expense/expense.dart';

class LocalExpense {
  static TbExpense? _tb;

  static Future<void> _init() async => _tb = TbExpense();

  static Future<bool> add({
    required String name,
    required int category,
    required String date,
    required String nominal,
  }) async {
    if (_tb == null) await _init();
    try {
      var data = ExpenseCompanion(
        name: Value(name),
        category: Value(category),
        date: Value(date),
        nominal: Value(nominal),
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
}
