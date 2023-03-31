import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/models/product.dart';
import 'package:chefpartner_mobile/src/services/product_service.dart';

class ProductController extends GenericController<Product, ProductService> {
  ProductController() : super(service: ProductService());
}
