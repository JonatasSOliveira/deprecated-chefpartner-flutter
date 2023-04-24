import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/models/product_model.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';

class ProductRepository extends GenericRepository<ProductModel, ProductDTO> {
  ProductRepository()
      : super(
            databaseModel: ProductModel(),
            defaultInsertAttributes: ['name', 'description', 'price']);

  @override
  List<Object?> getAttributesValues(ProductDTO model) {
    return [model.getName(), model.getDescription(), model.getPrice()];
  }

  @override
  ProductDTO fromMap(Map<String, dynamic> map) {
    return ProductDTO.fromMap(map);
  }
}
