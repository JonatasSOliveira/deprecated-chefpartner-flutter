import 'package:chefpartner_mobile/src/dao/product_dao.dart';
import 'package:chefpartner_mobile/src/models/product.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class ProductService extends GenericService<Product, ProductDAO> {
  ProductService() : super(dao: ProductDAO());
}
