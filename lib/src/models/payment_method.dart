import 'package:chefpartner_mobile/src/models/generic_model.dart';

class PaymentMethod extends GenericModel {
  String _name = '';

  PaymentMethod({
    super.id,
    required String name,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  }) : _name = name;

  PaymentMethod.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
  }

  String getName() {
    return _name;
  }
}
