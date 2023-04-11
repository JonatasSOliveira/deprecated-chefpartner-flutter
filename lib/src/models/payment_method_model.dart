import 'package:chefpartner_mobile/src/models/generic_model.dart';

class PaymentMethodModel extends GenericModel {
  PaymentMethodModel()
      : super(
          tableName: 'payment_method',
          attributes: [
            Attribute(name: 'name', type: AttributeType.text),
          ],
        );
}
