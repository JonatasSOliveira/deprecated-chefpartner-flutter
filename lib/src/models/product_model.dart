import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';

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
