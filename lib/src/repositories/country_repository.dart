import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/dtos/country_dto.dart';
import 'package:chefpartner_mobile/src/models/country_model.dart';

class CountryRepository extends GenericRepository<CountryModel, CountryDTO> {
  CountryRepository()
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
