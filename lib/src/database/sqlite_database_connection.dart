import 'package:chefpartner_mobile/src/database/database_cmds.dart';
import 'package:chefpartner_mobile/src/database/database_migration_runner.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDatabaseConnection {
  static Database? _db;
  static bool _migrationsAlreadyRunning = false;

  static Future<void> createDatabase() async {
    if (_db != null) {
      return;
    }

    String path = join(await getDatabasesPath(), 'chefpartner.db');
    _db = await openDatabase(path, onOpen: (db) async {
      await DatabaseCmds(db).syncTables();
    });
    if (!_migrationsAlreadyRunning) {
      _migrationsAlreadyRunning = true;
      DatabaseMigrationRunner(_db!).runMigrations();
    }
  }

  static Future<Database> getDatabase() async {
    if (_db == null) {
      await createDatabase();
    }

    return _db!;
  }
}
