import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/database_models/product_dm.dart';
import 'package:chefpartner_mobile/src/models/product.dart';

class ProductDAO extends GenericDAO<ProductDM, Product> {
  ProductDAO()
      : super(databaseModel: ProductDM(), defaultInsertAttributes: ['name']);

  @override
  List<Object?> getAttributesValues(Product model) {
    return [model.getName()];
  }

  @override
  Product fromMap(Map<String, dynamic> map) {
    return Product.fromMap(map);
  }
}
