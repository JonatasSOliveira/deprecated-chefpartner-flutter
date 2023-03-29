import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:chefpartner_mobile/src/database_models/customer_address_dm.dart';
import 'package:chefpartner_mobile/src/database_models/product_dm.dart';
import 'package:chefpartner_mobile/src/database_models/customer_dm.dart';
import 'package:chefpartner_mobile/src/database_models/payment_method_dm.dart';

class SQLiteDatabaseConnection {
  static Database? _db;

  static void _syncTables(Database db) {
    db.execute(PaymentMethodDM().getCreateTableScript());
    db.execute(ProductDM().getCreateTableScript());
    db.execute(CustomerDM().getCreateTableScript());
    db.execute(CustomerAddressDM().getCreateTableScript());
  }

  static Future<void> createDatabase() async {
    if (_db != null) {
      return;
    }

    String path = join(await getDatabasesPath(), 'chefpartner.db');
    _db = await openDatabase(path, onOpen: (db) => _syncTables(db));
  }

  static Future<Database> getDatabase() async {
    if (_db == null) {
      await createDatabase();
    }

    return _db!;
  }
}
