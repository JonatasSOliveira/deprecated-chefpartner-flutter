import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/database_models/order_dm.dart';
import 'package:chefpartner_mobile/src/models/order.dart';

class OrderDAO extends GenericDAO<OrderDM, Order> {
  OrderDAO() : super(databaseModel: OrderDM(), defaultInsertAttributes: []);

  @override
  List<Object?> getAttributesValues(Order model) {
    return [model.id];
  }

  @override
  Order fromMap(Map<String, dynamic> map) {
    return Order.fromMap(map);
  }
}
