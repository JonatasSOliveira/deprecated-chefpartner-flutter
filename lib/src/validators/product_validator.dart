import 'package:chefpartner_mobile/src/exceptions/validation_exception.dart';
import 'package:chefpartner_mobile/src/interfaces/default_validator_interface.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';

class ProductValidator implements DefaultValidatorInterface<ProductDTO> {
  @override
  void createUpdateValidation(ProductDTO model) {
    if (model.getName().isEmpty) {
      throw ValidationException('Product name is required');
    }

    if (model.getPrice() <= 0) {
      throw ValidationException('Product price is required');
    }
  }
}
