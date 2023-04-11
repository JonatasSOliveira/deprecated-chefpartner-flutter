import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/models/product_model.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';

class ProductDAO extends GenericDAO<ProductModel, ProductDTO> {
  ProductDAO()
      : super(databaseModel: ProductModel(), defaultInsertAttributes: ['name']);

  @override
  List<Object?> getAttributesValues(ProductDTO model) {
    return [model.getName()];
  }

  @override
  ProductDTO fromMap(Map<String, dynamic> map) {
    return ProductDTO.fromMap(map);
  }
}
