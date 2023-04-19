import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class CountryDTO extends GenericDTO {
  String _name = '';

  CountryDTO({
    required String name,
  }) : _name = name;

  CountryDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
  }

  String getName() => _name;
}
