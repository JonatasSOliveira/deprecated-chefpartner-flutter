import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class ProductDTO extends GenericDTO {
  String _name = '';
  String? _description;
  int _price = 0;

  ProductDTO({
    super.id,
    required String name,
    required int price,
    String? description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  })  : _price = price,
        _description = description,
        _name = name;

  ProductDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
    _description = map['description'];
    _price = map['price'];
  }

  String getName() => _name;

  String getDescription() => _description ?? '';

  int getPrice() => _price;
}
