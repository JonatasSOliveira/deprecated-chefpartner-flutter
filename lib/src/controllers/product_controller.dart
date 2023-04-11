import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';
import 'package:chefpartner_mobile/src/services/product_service.dart';

class ProductController extends GenericController<ProductDTO, ProductService> {
  ProductController() : super(service: ProductService());
}
