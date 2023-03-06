import 'package:chefpatner_mobile/src/models/generic_model.dart';

class Product extends GenericModel {
  final String? name;
  final String? description;
  final int? price;

  Product({
    super.id,
    required this.name,
    required this.price,
    this.description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Product.getSQLDefinition()
      : name = null,
        price = null,
        description = null,
        super.getSQLDefinition('product', [
          Attribute(name: 'name', type: AttributeType.text),
          Attribute(
              name: 'description', type: AttributeType.text, isNulable: true),
          Attribute(name: 'price', type: AttributeType.integer)
        ]);
}
