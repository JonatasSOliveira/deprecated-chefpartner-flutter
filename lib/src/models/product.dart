import 'package:chefpartner_mobile/src/models/generic_model.dart';

class Product extends GenericModel {
  String? name;
  String? description;
  int? price;

  Product({
    super.id,
    required this.name,
    required this.price,
    this.description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Product.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    name = map['name'];
  }
}
