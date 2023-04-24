import 'package:chefpartner_mobile/src/database/sqlite_database_connection.dart';
import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

abstract class GenericRepository<DM extends GenericModel,
    M extends GenericDTO> {
  final DM _databaseModel;
  final List<String> _defaultInsertAttributes;

  GenericRepository(
      {required DM databaseModel,
      required List<String> defaultInsertAttributes})
      : _databaseModel = databaseModel,
        _defaultInsertAttributes = defaultInsertAttributes;

  List<Object?> getAttributesValues(M model);

  M fromMap(Map<String, dynamic> map);

  @protected
  DM getModel() => _databaseModel;

  @protected
  Future<Database> getDatabaseConnection() =>
      SQLiteDatabaseConnection.getDatabase();

  Future<void> create(M model) async {
    final dbConnection = await SQLiteDatabaseConnection.getDatabase();
    final script = _databaseModel.getInsertScript(_defaultInsertAttributes);
    await dbConnection.rawInsert(script, getAttributesValues(model));
  }

  Future<List<M>> findAll() async {
    final dbConnection = await SQLiteDatabaseConnection.getDatabase();
    final script = _databaseModel.getSelectScript();
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
