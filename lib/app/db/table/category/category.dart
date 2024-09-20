import 'package:drift/drift.dart';
import 'package:moneyexpense/app/db/init.dart';

part 'category.g.dart';

class Category extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get color => text()();

  TextColumn get icon => text()();
}

@DriftDatabase(tables: [Category])
class TbCategory extends _$TbCategory {
  TbCategory() : super(Db.category());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => Db.version;

  Future<List<CategoryData>> read() async {
    try {
      return await (select(category)).get();
    } catch (e) {
      return [];
    }
  }

  Future<bool> create(CategoryCompanion data) async {
    try {
      var result = await into(category).insert(data);
      return result > 0;
    } catch (e) {
      return false;
    }
  }

  Future<bool> clear() async {
    try {
      var result = await delete(category).go();
      return result > 0;
    } catch (e) {
      return false;
    }
  }
}
