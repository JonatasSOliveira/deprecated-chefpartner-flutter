import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/models/payment_method_model.dart';
import 'package:chefpartner_mobile/src/dtos/payment_method_dto.dart';

class PaymentMethodRepository
    extends GenericRepository<PaymentMethodModel, PaymentMethodDTO> {
  PaymentMethodRepository()
      : super(
            databaseModel: PaymentMethodModel(),
            defaultInsertAttributes: ['name']);

  @override
  List<Object?> getAttributesValues(PaymentMethodDTO model) {
    return [model.getName()];
  }

  @override
  PaymentMethodDTO fromMap(Map<String, dynamic> map) {
    return PaymentMethodDTO.fromMap(map);
  }
}
