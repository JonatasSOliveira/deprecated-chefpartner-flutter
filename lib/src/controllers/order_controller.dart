import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/dtos/order_dto.dart';
import 'package:chefpartner_mobile/src/services/order_service.dart';

class OrderController extends GenericController<OrderDTO, OrderService> {
  OrderController() : super(service: OrderService());
}
