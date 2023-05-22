import 'package:chefpartner_mobile/src/models/generic_model/query_options.dart';
import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/dtos/enterprise_dto.dart';
import 'package:chefpartner_mobile/src/models/enterprise_model.dart';

class EnterpriseRepository
    extends GenericRepository<EnterpriseModel, EnterpriseDTO> {
  EnterpriseRepository()
      : super(
          databaseModel: EnterpriseModel(),
          defaultInsertAttributes: [
            'fantasy_name',
            'business_name',
            'firebase_id',
            'federal_document'
          ],
        );

  @override
  List<Object?> getAttributesValues(EnterpriseDTO model) => [
        model.getFantasyName(),
        model.getBusinessName(),
        model.getFirebaseId(),
        model.getFederalDocument(),
      ];

  @override
  EnterpriseDTO fromMap(Map<String, dynamic> map) {
    return EnterpriseDTO.fromMap(map);
  }

  Future<EnterpriseDTO?> findFirstEnterprise() async {
    final selectLastMigrationSql =
        getModel().getSelectScript(queryOptions: const QueryOptions(limit: 1));
    final dbConnection = await getDatabaseConnection();
    try {
      final result = await dbConnection.rawQuery(selectLastMigrationSql);
      return result.toList().isNotEmpty ? fromMap(result[0]) : null;
    } catch (e) {
      return null;  
    }
  }
}
