import 'package:chefpatner_mobile/src/database/sqlite_database_connection.dart';
import 'package:chefpatner_mobile/src/database_models/payment_method_dm.dart';
import 'package:chefpatner_mobile/src/models/payment_method.dart';

class PaymentMethodDAO {
  final _paymentMethodDM = PaymentMethodDM();

  Future<void> create(PaymentMethod paymentMethod) async {
    final dbConnection = await SQLiteDatabaseConnection.getDatabase();
    final script = _paymentMethodDM.getInsertScript(["name"]);

    await dbConnection.rawInsert(script, [paymentMethod.name]);
  }
}
