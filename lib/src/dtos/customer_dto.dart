import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class CustomerDTO extends GenericDTO {
  String _name = '';
  String? federalDocument;

  CustomerDTO({
    super.id,
    required String name,
    required this.federalDocument,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  }) : _name = name;

  CustomerDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
  }

  String getName() => _name;
}
