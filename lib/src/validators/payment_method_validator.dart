import 'package:chefpartner_mobile/src/exceptions/validation_exception.dart';
import 'package:chefpartner_mobile/src/interfaces/validator_interface.dart';
import 'package:chefpartner_mobile/src/models/payment_method.dart';

class PaymentMethodValidator implements ValidatorInterface<PaymentMethod> {
  @override
  void createUpdateValidation(PaymentMethod model) {
    if (model.getName().isEmpty) {
      throw ValidationException('Payment method name is required');
    }
  }
}