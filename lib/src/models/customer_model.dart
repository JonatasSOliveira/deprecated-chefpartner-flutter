import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';

class CustomerModel extends GenericModel {
  CustomerModel()
      : super(tableName: 'customer', attributes: [
          Attribute(name: 'name', type: AttributeType.text),
          Attribute(name: 'federal_document', type: AttributeType.text),
        ]);
}
