import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/dtos/state_dto.dart';
import 'package:chefpartner_mobile/src/models/state_model.dart';

class StateDAO extends GenericDAO<StateModel, StateDTO> {
  StateDAO()
      : super(
            databaseModel: StateModel(),
            defaultInsertAttributes: ['name', 'abbreviation', 'country_id']);

  @override
  List<Object?> getAttributesValues(StateDTO model) =>
      [model.getName(), model.getAbbreviation(), model.getCountry()?.getId()];

  @override
  StateDTO fromMap(Map<String, dynamic> map) {
    return StateDTO.fromMap(map);
  }
}
