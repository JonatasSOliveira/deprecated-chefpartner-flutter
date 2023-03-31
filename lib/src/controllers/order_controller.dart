import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/models/order.dart';
import 'package:chefpartner_mobile/src/services/order_service.dart';

class OrderController extends GenericController<Order, OrderService> {
  OrderController() : super(service: OrderService());
}
