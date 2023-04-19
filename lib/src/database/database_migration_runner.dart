import 'package:sqflite/sqflite.dart';
import 'package:chefpartner_mobile/src/dao/migration_dao.dart';
import 'package:chefpartner_mobile/src/dtos/migration_dto.dart';
import 'package:chefpartner_mobile/src/interfaces/migration_interface.dart';
import 'package:chefpartner_mobile/src/database/migrations/migration_202304191534_update_country_state.dart';

class DatabaseMigrationRunner {
  final Database _db;
  final MigrationDAO _migrationDAO = MigrationDAO();
  final List<MigrationInterface> _migrations = [UpdateCountryStateMigration()];

  DatabaseMigrationRunner(this._db);

  Future<void> runMigrations() async {
    for (var migration in _migrations) {
      final migrationDB =
          await _migrationDAO.getMigrationByName(migration.getName());

      if (migrationDB != null) {
        return;
      }

      await migration.run(_db);
      await _migrationDAO.create(MigrationDTO(name: migration.getName()));
    }
  }
}
