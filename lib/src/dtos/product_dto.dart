import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class ProductDTO extends GenericDTO {
  String _name = '';
  String? description;
  int price = 0;

  ProductDTO({
    super.id,
    required String name,
    required this.price,
    this.description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  }) : _name = name;

  ProductDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
  }

  String getName() => _name;

  String getDescription() => description ?? '';

  int getPrice() => price;
}
