import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

class Db {
  static const  _name = "_db_money_expense_basir.sqlite";
  static const version=1;

  static LazyDatabase expense() {
    return _init(dbname: "expense");
  }

  static LazyDatabase category() {
    return _init(dbname: "category");
  }

  static LazyDatabase _init({required String dbname}) {
    return LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(join(dir.path, "$dbname$_name"));

      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }
      var cachebase = (await getTemporaryDirectory()).path;
      sqlite3.tempDirectory = cachebase;
      return NativeDatabase.createInBackground(file);
    });
  }
}
