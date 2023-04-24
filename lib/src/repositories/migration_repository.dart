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

  Future<MigrationDTO?> getMigrationByName(String name) async {
    // TODO: Change where creation to model
    final script = '${getModel().getSelectScript()} AND name = ? LIMIT 1';
    final dbConnection = await getDatabaseConnection();
    final result = await dbConnection.rawQuery(script, [name]);
    return result.toList().isNotEmpty ? fromMap(result[0]) : null;
  }
}
