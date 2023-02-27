import 'package:sqflite/sqflite.dart';

import 'package:chefpatner_mobile/src/models/payment_method.dart';
import 'package:chefpatner_mobile/src/services/sqlite/database_connection.dart';

class PaymentMethodDao {
  late Database _db;

  Future<bool> _create(PaymentMethod paymentMethod) async {
    const String sql = '''
      INSERT INTO payment_methods (
        name
      ) VALUES (?)
    ''';
    final int affectedRows = await _db.rawInsert(sql, [paymentMethod.name]);
    return affectedRows > 0;
  }

  Future<bool> _update(PaymentMethod paymentMethod) async {
    const String sql = '''
      UPDATE payment_methods SET
        name = ?
      WHERE id = ?
    ''';
    final int affectedRows = await _db.rawUpdate(sql, [
      paymentMethod.name,
      paymentMethod.id,
    ]);
    return affectedRows > 0;
  }

  Future<bool> save(PaymentMethod paymentMethod) async {
    _db = await DatabaseConnection.getDatabase();

    if (paymentMethod.id == null) {
      return await _create(paymentMethod);
    }

    return await _update(paymentMethod);
  }
}
