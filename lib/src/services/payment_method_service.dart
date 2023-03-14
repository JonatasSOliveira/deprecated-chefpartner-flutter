import 'package:chefpatner_mobile/src/dao/payment_method_dao.dart';
import 'package:chefpatner_mobile/src/models/payment_method.dart';

class PaymentMethodService {
  final PaymentMethodDAO _paymentMethodDAO = PaymentMethodDAO();

  Future<void> create(PaymentMethod paymentMethod) async {
    await _paymentMethodDAO.create(paymentMethod);
  }
}
