import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';

class PaymentMethodModel extends GenericModel {
  PaymentMethodModel()
      : super(
          tableName: 'payment_method',
          attributes: [
            Attribute(name: 'name', type: AttributeType.text),
          ],
        );
}
