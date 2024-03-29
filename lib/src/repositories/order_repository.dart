import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/models/order_model.dart';
import 'package:chefpartner_mobile/src/dtos/order_dto.dart';

class OrderRepository extends GenericRepository<OrderModel, OrderDTO> {
  OrderRepository()
      : super(databaseModel: OrderModel(), defaultInsertAttributes: []);

  @override
  List<Object?> getAttributesValues(OrderDTO model) {
    return [];
  }

  @override
  OrderDTO fromMap(Map<String, dynamic> map) {
    return OrderDTO.fromMap(map);
  }
}
