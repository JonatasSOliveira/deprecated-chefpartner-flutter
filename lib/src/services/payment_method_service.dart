import 'package:chefpartner_mobile/src/dao/payment_method_dao.dart';
import 'package:chefpartner_mobile/src/dtos/payment_method_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';
import 'package:chefpartner_mobile/src/validators/payment_method_validator.dart';

class PaymentMethodService
    extends GenericService<PaymentMethodDTO, PaymentMethodDAO> {
  PaymentMethodService()
      : super(
          dao: PaymentMethodDAO(),
          validator: PaymentMethodValidator(),
        );
}
