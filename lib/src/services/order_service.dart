import 'package:chefpartner_mobile/src/dao/order_dao.dart';
import 'package:chefpartner_mobile/src/models/order.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class OrderService extends GenericService<Order, OrderDAO> {
  OrderService() : super(dao: OrderDAO());
}
