import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:chefpatner_mobile/src/models/customer.dart';
import 'package:chefpatner_mobile/src/models/payment_method.dart';
import 'package:chefpatner_mobile/src/models/product.dart';

class DatabaseConnection {
  static Database? _db;

  static void _syncTables(Database db) {
    db.execute(PaymentMethod.getSQLDefinition().getCreateTableScript());
    db.execute(Customer.getSQLDefinition().getCreateTableScript());
    db.execute(Product.getSQLDefinition().getCreateTableScript());
  }

  static Future<void> createDatabase() async {
    if (_db != null) {
      return;
    }

    String caminho = join(await getDatabasesPath(), 'chefpatner.db');
    _db = await openDatabase(
      caminho,
      onOpen: (db) => _syncTables(db),
    );
  }

  static Future<Database> getDatabase() async {
    if (_db == null) {
      await createDatabase();
    }

    return _db!;
  }
}
