import 'package:chefpartner_mobile/src/repositories/order_repository.dart';
import 'package:chefpartner_mobile/src/dtos/order_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class OrderService extends GenericService<OrderDTO, OrderRepository> {
  OrderService() : super(repository: OrderRepository());
}
