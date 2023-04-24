import 'package:chefpartner_mobile/src/repositories/country_repository.dart';
import 'package:chefpartner_mobile/src/repositories/state_repository.dart';
import 'package:chefpartner_mobile/src/database/database_cmds.dart';
import 'package:chefpartner_mobile/src/dtos/country_dto.dart';
import 'package:chefpartner_mobile/src/dtos/state_dto.dart';
import 'package:chefpartner_mobile/src/interfaces/migration_interface.dart';

class UpdateCountryStateMigration implements MigrationInterface {
  @override
  String getName() => '202304191534_update_country_state';

  @override
  Future<void> run(db) async {
    final databaseCmds = DatabaseCmds(db);
    await databaseCmds.insertDataFromJSON('assets/database_data/countrys.json',
        CountryRepository(), CountryDTO.fromMap);
    await databaseCmds.insertDataFromJSON('assets/database_data/states.json',
        StateRepository(), StateDTO.fromMap);
  }
}
