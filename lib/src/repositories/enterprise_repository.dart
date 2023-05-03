import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/dtos/enterprise_dto.dart';
import 'package:chefpartner_mobile/src/models/enterprise_model.dart';

class EnterpriseRepository
    extends GenericRepository<EnterpriseModel, EnterpriseDTO> {
  EnterpriseRepository()
      : super(
            databaseModel: EnterpriseModel(),
            defaultInsertAttributes: ['fantasy_name', 'business_name', 'uuid']);

  @override
  List<Object?> getAttributesValues(EnterpriseDTO model) => [
        model.getFantasyName(),
        model.getBusinessName(),
        model.getUuid(),
      ];

  @override
  EnterpriseDTO fromMap(Map<String, dynamic> map) {
    return EnterpriseDTO.fromMap(map);
  }
}
