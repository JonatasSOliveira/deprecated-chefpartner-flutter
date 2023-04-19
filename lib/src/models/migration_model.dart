import 'package:chefpartner_mobile/src/models/generic_model.dart';

class MigrationModel extends GenericModel {
  MigrationModel()
      : super(tableName: 'migration', attributes: [
          Attribute(name: 'name', type: AttributeType.text),
        ]);
}
