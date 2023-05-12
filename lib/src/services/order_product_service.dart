import 'package:chefpartner_mobile/src/repositories/order_product_repository.dart';
import 'package:chefpartner_mobile/src/dtos/order_product_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class OrderProductService extends GenericService<OrderProductDTO, OrderProductRepository> {
  OrderProductService() : super(repository: OrderProductRepository());
}
