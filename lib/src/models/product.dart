import 'package:chefpartner_mobile/src/models/generic_model.dart';

class Product extends GenericModel {
  String _name = '';
  String? description;
  int? price;

  Product({
    super.id,
    required String name,
    required this.price,
    this.description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  }) : _name = name;

  Product.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
  }

  String getName() => _name;
  
}
