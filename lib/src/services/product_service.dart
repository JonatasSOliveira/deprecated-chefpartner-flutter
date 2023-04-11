import 'package:chefpartner_mobile/src/dao/product_dao.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';
import 'package:chefpartner_mobile/src/validators/product_validator.dart';

class ProductService extends GenericService<ProductDTO, ProductDAO> {
  ProductService() : super(dao: ProductDAO(), validator: ProductValidator());
}
