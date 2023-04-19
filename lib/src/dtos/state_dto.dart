import 'package:chefpartner_mobile/src/dtos/country_dto.dart';
import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class StateDTO extends GenericDTO {
  String _name = '';
  String _abbreviation = '';
  CountryDTO? _country;

  StateDTO({
    required String name,
    required String abbreviation,
    required CountryDTO country,
  })  : _name = name,
        _abbreviation = abbreviation,
        _country = country;

  StateDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
    _abbreviation = map['abbreviation'];
    _country =
        map['country'] != null ? CountryDTO.fromMap(map['country']) : null;
  }

  String getName() => _name;

  String getAbbreviation() => _abbreviation;

  CountryDTO? getCountry() => _country;
}
