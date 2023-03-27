import 'package:chefpatner_mobile/src/dao/generic_dao.dart';
import 'package:chefpatner_mobile/src/database_models/payment_method_dm.dart';
import 'package:chefpatner_mobile/src/models/payment_method.dart';

class PaymentMethodDAO extends GenericDAO<PaymentMethodDM, PaymentMethod> {
  PaymentMethodDAO()
      : super(
            databaseModel: PaymentMethodDM(),
            defaultInsertAttributes: ['name']);

  @override
  List<Object?> getAttributesValues(PaymentMethod model) {
    return [model.name];
  }

  @override
  PaymentMethod fromMap(Map<String, dynamic> map) {
    return PaymentMethod.fromMap(map);
  }
}
