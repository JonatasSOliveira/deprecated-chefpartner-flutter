import 'package:chefpartner_mobile/src/models/city_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';

class EnterpriseModel extends GenericModel {
  EnterpriseModel()
      : super(tableName: 'enterprise', attributes: [
          Attribute(name: 'fantasy_name', type: AttributeType.text),
          Attribute(name: 'business_name', type: AttributeType.text),
          Attribute(name: 'federal_document', type: AttributeType.text),
          Attribute(name: 'firebase_id', type: AttributeType.text),
          Attribute(
              name: 'city_id',
              type: AttributeType.integer,
              foreignTable: CityModel()),
        ]);
}
