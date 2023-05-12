import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';

class OrderProductDTO extends GenericDTO {
  late ProductDTO _product;
  int _qtd = 0;
  int _unitPrice = 0;

  OrderProductDTO(
      {required ProductDTO product, required int qtd, required int unitPrice})
      : _product = product,
        _qtd = qtd,
        _unitPrice = unitPrice;

  OrderProductDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _qtd = map['qtd'];
    _unitPrice = map['unit_price'];
  }

  ProductDTO getProduct() => _product;

  int getQtd() => _qtd;

  int getUnitPrice() => _unitPrice;
}
