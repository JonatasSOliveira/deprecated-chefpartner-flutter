import 'package:chefpatner_mobile/src/dao/payment_method_dao.dart';
import 'package:chefpatner_mobile/src/models/payment_method.dart';

class PaymentMethodService {
  final PaymentMethodDAO _paymentMethodDAO = PaymentMethodDAO();

  void _validatePaymentMethod(PaymentMethod paymentMethod) {
    if (paymentMethod.name == null || paymentMethod.name == '') {
      throw ArgumentError('Name is required');
    }
  }

  Future<void> create(PaymentMethod paymentMethod) async {
    _validatePaymentMethod(paymentMethod);

    await _paymentMethodDAO.create(paymentMethod);
  }
}
