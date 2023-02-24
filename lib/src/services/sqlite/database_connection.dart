import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:chefpatner_mobile/src/services/sqlite/scripts.dart';

class DatabaseConnection {
  static Database? _db;

  static void _syncTables(Database db, int version) {
    for (var createTableScript in createTableScripts) {
      db.execute(createTableScript);
    }
  }

  static Future<void> createDatabase() async {
    if (_db != null) {
      return;
    }

    String caminho = join(await getDatabasesPath(), 'chefpatner.db');
    _db = await openDatabase(
      caminho,
      version: 1,
      onCreate: _syncTables,
    );
  }

  static Future<Database> getDatabase() async {
    if (_db == null) {
      await createDatabase();
    }

    return _db!;
  }
}
