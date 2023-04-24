import 'package:chefpartner_mobile/src/repositories/payment_method_repository.dart';
import 'package:chefpartner_mobile/src/dtos/payment_method_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';
import 'package:chefpartner_mobile/src/validators/payment_method_validator.dart';

class PaymentMethodService
    extends GenericService<PaymentMethodDTO, PaymentMethodRepository> {
  PaymentMethodService()
      : super(
          repository: PaymentMethodRepository(),
          validator: PaymentMethodValidator(),
        );
}
