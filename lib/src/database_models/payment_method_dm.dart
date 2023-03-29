import 'package:chefpartner_mobile/src/database_models/generic_dm.dart';

class PaymentMethodDM extends GenericDM {
  PaymentMethodDM()
      : super(
          tableName: 'payment_method',
          attributes: [
            Attribute(name: 'name', type: AttributeType.text),
          ],
        );
}
