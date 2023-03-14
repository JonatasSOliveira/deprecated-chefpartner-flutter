import 'package:chefpatner_mobile/src/database_models/customer_dm.dart';
import 'package:chefpatner_mobile/src/database_models/generic_dm.dart';

class CustomerAddressDM extends GenericDM {
  CustomerAddressDM()
      : super(tableName: 'customer_address', attributes: [
          Attribute(
              name: 'customer_id',
              type: AttributeType.integer,
              isForeignKey: true,
              foreignTable: CustomerDM().getTableName()),
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
