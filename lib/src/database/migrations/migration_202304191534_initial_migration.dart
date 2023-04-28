import 'package:sqflite/sqflite.dart';
import 'package:chefpartner_mobile/src/repositories/country_repository.dart';
import 'package:chefpartner_mobile/src/repositories/state_repository.dart';
import 'package:chefpartner_mobile/src/database/database_cmds.dart';
import 'package:chefpartner_mobile/src/dtos/country_dto.dart';
import 'package:chefpartner_mobile/src/dtos/state_dto.dart';
import 'package:chefpartner_mobile/src/interfaces/migration_interface.dart';
import 'package:chefpartner_mobile/src/models/migration_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/city_model.dart';
import 'package:chefpartner_mobile/src/models/country_model.dart';
import 'package:chefpartner_mobile/src/models/state_model.dart';
import 'package:chefpartner_mobile/src/models/customer_address_model.dart';
import 'package:chefpartner_mobile/src/models/product_model.dart';
import 'package:chefpartner_mobile/src/models/customer_model.dart';
import 'package:chefpartner_mobile/src/models/payment_method_model.dart';

class InitialMigrationMigration implements MigrationInterface {
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

  @override
  String getName() => '202304191534_initial_migration';

  @override
  Future<void> run(db) async {
    await _createTables(db);
    await _syncCountryStates(db);
  }

  Future<void> _createTables(Database db) async {
    for (var model in _models) {
      db.execute(model.getCreateTableScript());
    }
  }

  Future<void> _syncCountryStates(Database db) async {
    final databaseCmds = DatabaseCmds(db);
    await databaseCmds.insertDataFromJSON('assets/database_data/countrys.json',
        CountryRepository(), CountryDTO.fromMap);
    await databaseCmds.insertDataFromJSON('assets/database_data/states.json',
        StateRepository(), StateDTO.fromMap);
  }
}
