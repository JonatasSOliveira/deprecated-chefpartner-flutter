import 'package:chefpatner_mobile/src/database_models/generic_dm.dart';

class ProductDM extends GenericDM {
  ProductDM()
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
