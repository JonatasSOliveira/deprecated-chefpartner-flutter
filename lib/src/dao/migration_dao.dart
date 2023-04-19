import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/dtos/migration_dto.dart';
import 'package:chefpartner_mobile/src/models/migration_model.dart';

class MigrationDAO extends GenericDAO<MigrationModel, MigrationDTO> {
  MigrationDAO()
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
    final script = '${getModel().getSelectAllScript()} AND name = ? LIMIT 1';
    final dbConnection = await getDatabaseConnection();
    final result = await dbConnection.rawQuery(script, [name]);
    return result.toList().isNotEmpty ? fromMap(result[0]) : null;
  }
}
