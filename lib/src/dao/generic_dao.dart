import 'package:chefpartner_mobile/src/database/sqlite_database_connection.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';
import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

abstract class GenericDAO<DM extends GenericModel, M extends GenericDTO> {
  final DM _databaseModel;
  final List<String> _defaultInsertAttributes;

  GenericDAO({required databaseModel, required defaultInsertAttributes})
      : _databaseModel = databaseModel,
        _defaultInsertAttributes = defaultInsertAttributes;

  List<Object?> getAttributesValues(M model);

  M fromMap(Map<String, dynamic> map);

  Future<void> create(M model) async {
    final dbConnection = await SQLiteDatabaseConnection.getDatabase();
    final script = _databaseModel.getInsertScript(_defaultInsertAttributes);
    await dbConnection.rawInsert(script, getAttributesValues(model));
  }

  Future<List<M>> listAll() async {
    final dbConnection = await SQLiteDatabaseConnection.getDatabase();
    final script = _databaseModel.getSelectAllScript();
    final result = await dbConnection.rawQuery(script);
    return result.map((map) => fromMap(map)).toList();
  }

  Future<void> update(dynamic modelId, M model) async {
    final dbConnection = await SQLiteDatabaseConnection.getDatabase();
    final script = _databaseModel.getUpdateScript(_defaultInsertAttributes);
    await dbConnection
        .rawUpdate(script, [...getAttributesValues(model), modelId]);
  }

  Future<void> softDelete(int modelId) async {
    final dbConnection = await SQLiteDatabaseConnection.getDatabase();
    final script = _databaseModel.getSoftDeleteScript();
    await dbConnection.rawUpdate(script, [modelId]);
  }
}
