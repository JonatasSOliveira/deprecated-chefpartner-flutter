import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/dtos/state_dto.dart';
import 'package:chefpartner_mobile/src/models/state_model.dart';

class StateRepository extends GenericRepository<StateModel, StateDTO> {
  StateRepository()
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
