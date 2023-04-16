import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class CustomerDTO extends GenericDTO {
  String _name = '';
  String? _federalDocument;

  CustomerDTO({
    super.id,
    required String name,
    required String? federalDocument,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  })  : _federalDocument = federalDocument,
        _name = name;

  CustomerDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
    _federalDocument = map['federalDocument'];
  }

  String getName() => _name;

  String getFederalDocument() => _federalDocument ?? '';
}
