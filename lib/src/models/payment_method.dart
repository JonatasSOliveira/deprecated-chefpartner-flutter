import 'package:chefpatner_mobile/src/models/generic_model.dart';

class PaymentMethod extends GenericModel {
  final String? name;

  PaymentMethod({
    super.id,
    required this.name,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });
}
