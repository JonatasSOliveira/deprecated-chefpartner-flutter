import 'package:chefpatner_mobile/src/models/payment_method.dart';
import 'package:chefpatner_mobile/src/services/payment_method_service.dart';

class PaymentMethodController {
  final PaymentMethodService _paymentMethodService = PaymentMethodService();

  Future<void> create(PaymentMethod paymentMethod) async {
    await _paymentMethodService.create(paymentMethod);
  }
}
