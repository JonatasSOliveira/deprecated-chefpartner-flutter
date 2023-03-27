import 'package:chefpatner_mobile/src/models/generic_model.dart';

class PaymentMethod extends GenericModel {
  String? name;

  PaymentMethod({
    super.id,
    this.name,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  PaymentMethod.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    name = map['name'];
  }
}
