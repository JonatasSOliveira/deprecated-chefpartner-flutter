import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:chefpartner_mobile/src/dtos/state_dto.dart';

class CityDTO extends GenericDTO {
  String _name = '';
  StateDTO? _state;

  CityDTO({
    required String name,
    required StateDTO state,
  })  : _name = name,
        _state = state;

  CityDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
    _state = map['state'] != null ? StateDTO.fromMap(map['state']) : null;
  }

  String getName() => _name;

  StateDTO? getState() => _state;
}
