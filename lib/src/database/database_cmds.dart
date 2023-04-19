import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:chefpartner_mobile/src/models/migration_model.dart';
import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/city_model.dart';
import 'package:chefpartner_mobile/src/models/country_model.dart';
import 'package:chefpartner_mobile/src/models/state_model.dart';
import 'package:chefpartner_mobile/src/models/customer_address_model.dart';
import 'package:chefpartner_mobile/src/models/product_model.dart';
import 'package:chefpartner_mobile/src/models/customer_model.dart';
import 'package:chefpartner_mobile/src/models/payment_method_model.dart';

class DatabaseCmds {
  final Database _db;
  final List<GenericModel> _models = [
    MigrationModel(),
    PaymentMethodModel(),
    ProductModel(),
    CountryModel(),
    StateModel(),
    CityModel(),
    CustomerModel(),
    CustomerAddressModel()
  ];

  DatabaseCmds(this._db);

  Future<void> syncTables() async {
    for (var model in _models) {
      await _db.execute(model.getCreateTableScript());
    }
  }

  Future<void> insertDataFromJSON(String jsonPath, GenericDAO dao,
      Function(Map<String, dynamic>) dtoFromMap) async {
    String jsonString = await rootBundle.loadString(jsonPath);
    List<dynamic> jsonList = json.decode(jsonString);
    for (var item in jsonList) {
      dao.create(dtoFromMap(item));
    }
  }
}
