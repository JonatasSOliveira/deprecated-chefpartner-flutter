import 'package:chefpartner_mobile/src/models/customer_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';

class CustomerAddressModel extends GenericModel {
  CustomerAddressModel()
      : super(tableName: 'customer_address', attributes: [
          Attribute(
              name: 'customer_id',
              type: AttributeType.integer,
              isForeignKey: true,
              foreignTable: CustomerModel().getTableName()),
          Attribute(name: 'address', type: AttributeType.text),
          Attribute(name: 'city', type: AttributeType.text),
          Attribute(name: 'state', type: AttributeType.text),
          Attribute(name: 'number', type: AttributeType.text),
          Attribute(
              name: 'complement', type: AttributeType.text, isNulable: true),
          Attribute(
              name: 'reference_point',
              type: AttributeType.text,
              isNulable: true)
        ]);
}
