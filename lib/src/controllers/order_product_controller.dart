import 'package:chefpartner_mobile/src/services/order_product_service.dart';
import 'package:chefpartner_mobile/src/dtos/order_product_dto.dart';
import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';

class OrderProductController extends GenericController<OrderProductDTO, OrderProductService> {
  OrderProductController() : super(service: OrderProductService());
}
