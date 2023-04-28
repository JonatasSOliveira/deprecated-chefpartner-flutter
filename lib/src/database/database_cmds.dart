import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:chefpartner_mobile/src/models/migration_model.dart';
import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';

class DatabaseCmds {
  final Database _db;
  DatabaseCmds(this._db);

  Future<void> createMigrationTable() async {
    await _db.execute(MigrationModel().getCreateTableScript());
  }

  Future<void> insertDataFromJSON(String jsonPath, GenericRepository dao,
      Function(Map<String, dynamic>) dtoFromMap) async {
    String jsonString = await rootBundle.loadString(jsonPath);
    List<dynamic> jsonList = json.decode(jsonString);
    for (var item in jsonList) {
      dao.create(dtoFromMap(item));
    }
  }
}
