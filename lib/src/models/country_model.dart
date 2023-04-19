import 'package:chefpartner_mobile/src/models/generic_model.dart';

class CountryModel extends GenericModel {
  CountryModel()
      : super(tableName: 'country', attributes: [
          Attribute(name: 'name', type: AttributeType.text),
        ]);
}
