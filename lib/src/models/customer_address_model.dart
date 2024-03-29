import 'package:chefpartner_mobile/src/models/city_model.dart';
import 'package:chefpartner_mobile/src/models/customer_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';

class CustomerAddressModel extends GenericModel {
  CustomerAddressModel()
      : super(tableName: 'customer_address', attributes: [
          Attribute(
              name: 'customer_id',
              type: AttributeType.integer,
              foreignTable: CustomerModel()),
          Attribute(name: 'address', type: AttributeType.text),
          Attribute(
              name: 'city_id',
              type: AttributeType.integer,
              foreignTable: CityModel()),
          Attribute(name: 'number', type: AttributeType.text),
          Attribute(
              name: 'complement', type: AttributeType.text, isNulable: true),
          Attribute(
              name: 'reference_point',
              type: AttributeType.text,
              isNulable: true)
        ]);
}
