import 'package:chefpartner_mobile/src/repositories/product_repository.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';
import 'package:chefpartner_mobile/src/validators/product_validator.dart';

class ProductService extends GenericService<ProductDTO, ProductRepository> {
  ProductService()
      : super(repository: ProductRepository(), validator: ProductValidator());
}
