import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/models/order_model.dart';
import 'package:chefpartner_mobile/src/dtos/order_dto.dart';

class OrderDAO extends GenericDAO<OrderModel, OrderDTO> {
  OrderDAO() : super(databaseModel: OrderModel(), defaultInsertAttributes: []);

  @override
  List<Object?> getAttributesValues(OrderDTO model) {
    return [];
  }

  @override
  OrderDTO fromMap(Map<String, dynamic> map) {
    return OrderDTO.fromMap(map);
  }
}
