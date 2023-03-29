import 'package:chefpartner_mobile/src/database_models/generic_dm.dart';

class CustomerDM extends GenericDM {
  CustomerDM()
      : super(tableName: 'customer', attributes: [
          Attribute(name: 'name', type: AttributeType.text),
          Attribute(name: 'federal_document', type: AttributeType.text),
        ]);
}
