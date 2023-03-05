import 'package:chefpatner_mobile/src/daos/payment_method_dao.dart';
import 'package:chefpatner_mobile/src/models/payment_method.dart';

class PaymentMethodController {
  static final PaymentMethodDao _paymentMethodDao = PaymentMethodDao();

  static void _validadePaymentMethod(PaymentMethod paymentMethod) {
    if (paymentMethod.name == null || paymentMethod.name == '') {
      throw Exception('Nome da forma de pagamento é obrigatório');
    }
  }

  static Future<bool> save(PaymentMethod paymentMethod) async {
    _validadePaymentMethod(paymentMethod);

    return await _paymentMethodDao.save(paymentMethod);
  }
}
