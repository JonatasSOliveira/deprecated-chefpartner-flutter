import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';
import 'package:chefpartner_mobile/src/models/product_model.dart';

class OrderProductModel extends GenericModel {
  OrderProductModel()
      : super(tableName: 'order_product', attributes: [
          Attribute(
              name: 'product_id',
              type: AttributeType.integer,
              foreignTable: ProductModel()),
          Attribute(name: 'qtd', type: AttributeType.integer),
          Attribute(name: 'unit_price', type: AttributeType.integer)
        ]);
}
