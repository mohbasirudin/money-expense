import 'package:drift/drift.dart';
import 'package:moneyexpense/app/db/init.dart';

part 'expense.g.dart';

class Expense extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get date => text()();

  TextColumn get nominal => text()();

  TextColumn get categoryName => text()();

  TextColumn get categoryIcon => text()();

  TextColumn get categoryColor => text()();
}

@DriftDatabase(tables: [Expense])
class TbExpense extends _$TbExpense {
  TbExpense() : super(Db.expense());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => Db.version;

  Future<bool> create(ExpenseCompanion data) async {
    try {
      var result = await into(expense).insert(data);
      return result > 0;
    } catch (e) {
      print("gagal: $e");
      return false;
    }
  }

  Future<List<ExpenseData>> read() async {
    try {
      return await select(expense).get();
    } catch (e) {
      return [];
    }
  }
}
