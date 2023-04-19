import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';

class CountryModel extends GenericModel {
  CountryModel()
      : super(tableName: 'country', attributes: [
          Attribute(name: 'name', type: AttributeType.text),
        ]);
}
