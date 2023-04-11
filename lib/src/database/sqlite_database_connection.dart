import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:chefpartner_mobile/src/models/customer_address_model.dart';
import 'package:chefpartner_mobile/src/models/product_model.dart';
import 'package:chefpartner_mobile/src/models/customer_model.dart';
import 'package:chefpartner_mobile/src/models/payment_method_model.dart';

class SQLiteDatabaseConnection {
  static Database? _db;

  static void _syncTables(Database db) {
    db.execute(PaymentMethodModel().getCreateTableScript());
    db.execute(ProductModel().getCreateTableScript());
    db.execute(CustomerModel().getCreateTableScript());
    db.execute(CustomerAddressModel().getCreateTableScript());
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
