import 'package:chefpartner_mobile/src/models/country_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';

class StateModel extends GenericModel {
  StateModel()
      : super(tableName: 'state', attributes: [
          Attribute(name: 'name', type: AttributeType.text),
          Attribute(name: 'abbreviation', type: AttributeType.text),
          Attribute(
              name: 'country_id',
              type: AttributeType.integer,
              foreignTable: CountryModel()),
        ]);
}
