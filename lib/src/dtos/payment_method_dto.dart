import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class PaymentMethodDTO extends GenericDTO {
  String _name = '';

  PaymentMethodDTO({
    super.id,
    required String name,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  }) : _name = name;

  PaymentMethodDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
  }

  String getName() => _name;
}
