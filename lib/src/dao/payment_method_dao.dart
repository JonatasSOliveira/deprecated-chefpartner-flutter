import 'package:chefpatner_mobile/src/database/sqlite_database_connection.dart';
import 'package:chefpatner_mobile/src/models/payment_method.dart';
import 'package:sqflite/sqflite.dart';

class PaymentMethodDAO {
  late final Database _dbConnection;

  PaymentMethodDAO() {
    SQLiteDatabaseConnection.getDatabase()
        .then((dbConnection) => _dbConnection = dbConnection);
  }

  Future<void> create(PaymentMethod paymentMethod) async {
    const script = '''
      INSERT INTO payment_methods (
        name,
      ) VALUES (
        ?
      )
    ''';

    await _dbConnection.rawInsert(script, [paymentMethod.name]);
  }
}
