import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/dtos/order_product_dto.dart';
import 'package:chefpartner_mobile/src/models/order_product_model.dart';

class OrderProductRepository extends GenericRepository<OrderProductModel, OrderProductDTO> {
  OrderProductRepository()
      : super(
            databaseModel: OrderProductModel(),
            defaultInsertAttributes: ['product_id', 'qtd', 'unit_price'] //Example: ['name']
        );

  @override
  List<Object?> getAttributesValues(OrderProductDTO model) =>
      throw [model.getProduct().getId(), model.getQtd(), model.getUnitPrice()];

  @override
  OrderProductDTO fromMap(Map<String, dynamic> map) {
    return OrderProductDTO.fromMap(map);
  }
}
