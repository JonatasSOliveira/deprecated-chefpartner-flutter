import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/services/payment_method_service.dart';

class PaymentMethodController extends GenericController {
  PaymentMethodController() : super(service: PaymentMethodService());
}
