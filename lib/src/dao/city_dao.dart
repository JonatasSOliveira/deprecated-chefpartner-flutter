import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/dtos/city_dto.dart';
import 'package:chefpartner_mobile/src/models/city_model.dart';

class CityDAO extends GenericDAO<CityModel, CityDTO> {
  CityDAO()
      : super(databaseModel: CityModel(), defaultInsertAttributes: [
          'name',
        ]);

  @override
  List<Object?> getAttributesValues(CityDTO model) => [
        model.getName(),
      ];

  @override
  CityDTO fromMap(Map<String, dynamic> map) {
    return CityDTO.fromMap(map);
  }
}
