import 'package:chefpartner_mobile/src/models/country_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';

class StateModel extends GenericModel {
  StateModel()
      : super(tableName: 'state', attributes: [
          Attribute(name: 'name', type: AttributeType.text),
          Attribute(name: 'abbreviation', type: AttributeType.text),
          Attribute(
              name: 'country_id',
              type: AttributeType.integer,
              isForeignKey: true,
              foreignTable: CountryModel().getTableName()),
        ]);
}