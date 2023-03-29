import 'package:chefpartner_mobile/src/dao/payment_method_dao.dart';
import 'package:chefpartner_mobile/src/models/payment_method.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class PaymentMethodService
    extends GenericService<PaymentMethod, PaymentMethodDAO> {
  PaymentMethodService() : super(dao: PaymentMethodDAO());

  @override
  void validateModel(PaymentMethod model) {
    if (model.name == null || model.name == '') {
      throw ArgumentError('Name is required');
    }
  }
}