import 'package:chefpartner_mobile/src/exceptions/validation_exception.dart';
import 'package:chefpartner_mobile/src/interfaces/default_validator_interface.dart';
import 'package:chefpartner_mobile/src/dtos/payment_method_dto.dart';

class PaymentMethodValidator
    implements DefaultValidatorInterface<PaymentMethodDTO> {
  @override
  void createUpdateValidation(PaymentMethodDTO model) {
    if (model.getName().isEmpty) {
      throw ValidationException('Payment method name is required');
    }
  }
}
