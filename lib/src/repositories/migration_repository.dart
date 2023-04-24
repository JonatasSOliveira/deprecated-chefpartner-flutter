import 'package:chefpartner_mobile/src/models/generic_model/query_options.dart';
import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/dtos/migration_dto.dart';
import 'package:chefpartner_mobile/src/models/migration_model.dart';

class MigrationRepository
    extends GenericRepository<MigrationModel, MigrationDTO> {
  MigrationRepository()
      : super(databaseModel: MigrationModel(), defaultInsertAttributes: [
          'name',
        ]);

  @override
  List<Object?> getAttributesValues(MigrationDTO model) => [
        model.getName(),
      ];

  @override
  MigrationDTO fromMap(Map<String, dynamic> map) {
    return MigrationDTO.fromMap(map);
  }

  Future<MigrationDTO?> findLastMigration() async {
    final selectLastMigrationSql = getModel().getSelectScript(
        queryOptions: const QueryOptions(limit: 1, orderBy: [
      OrderOptions(attributeName: 'id', orderDirection: OrderDirection.desc)
    ]));
    final dbConnection = await getDatabaseConnection();
    final result = await dbConnection.rawQuery(selectLastMigrationSql);
    return result.toList().isNotEmpty ? fromMap(result[0]) : null;
  }
}
