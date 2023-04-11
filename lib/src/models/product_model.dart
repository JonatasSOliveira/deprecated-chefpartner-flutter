import 'package:chefpartner_mobile/src/models/generic_model.dart';

class ProductModel extends GenericModel {
  ProductModel()
      : super(
          tableName: 'product',
          attributes: [
            Attribute(name: 'name', type: AttributeType.text),
            Attribute(
                name: 'description', type: AttributeType.text, isNulable: true),
            Attribute(name: 'price', type: AttributeType.integer)
          ],
        );
}
