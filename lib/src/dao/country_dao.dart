import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/dtos/country_dto.dart';
import 'package:chefpartner_mobile/src/models/country_model.dart';

class CountryDAO extends GenericDAO<CountryModel, CountryDTO> {
  CountryDAO()
      : super(databaseModel: CountryModel(), defaultInsertAttributes: [
          'name',
        ]);

  @override
  List<Object?> getAttributesValues(CountryDTO model) => [
        model.getName(),
      ];

  @override
  CountryDTO fromMap(Map<String, dynamic> map) {
    return CountryDTO.fromMap(map);
  }
}
