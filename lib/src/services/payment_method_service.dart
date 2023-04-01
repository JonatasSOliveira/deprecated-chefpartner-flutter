import 'package:chefpartner_mobile/src/dao/payment_method_dao.dart';
import 'package:chefpartner_mobile/src/models/payment_method.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';
import 'package:chefpartner_mobile/src/validators/payment_method_validator.dart';

class PaymentMethodService
    extends GenericService<PaymentMethod, PaymentMethodDAO> {
  PaymentMethodService()
      : super(
          dao: PaymentMethodDAO(),
          validator: PaymentMethodValidator(),
        );
}
