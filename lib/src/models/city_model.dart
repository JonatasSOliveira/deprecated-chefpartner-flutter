import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/state_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';

class CityModel extends GenericModel {
  CityModel()
      : super(tableName: 'city', attributes: [
          Attribute(name: 'name', type: AttributeType.text),
          Attribute(
              name: 'state_id',
              type: AttributeType.integer,
              isForeignKey: true,
              foreignTable: StateModel().getTableName()),
        ]);
}
