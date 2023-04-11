import 'package:chefpartner_mobile/src/dao/order_dao.dart';
import 'package:chefpartner_mobile/src/dtos/order_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class OrderService extends GenericService<OrderDTO, OrderDAO> {
  OrderService() : super(dao: OrderDAO());
}
