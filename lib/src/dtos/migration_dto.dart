import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class MigrationDTO extends GenericDTO {
  String _name = '';

  MigrationDTO({
    required String name,
  }) : _name = name;

  MigrationDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
  }

  String getName() => _name;
}
