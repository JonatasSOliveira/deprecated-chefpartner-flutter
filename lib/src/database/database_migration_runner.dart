import 'package:sqflite/sqflite.dart';
import 'package:chefpartner_mobile/src/repositories/migration_repository.dart';
import 'package:chefpartner_mobile/src/dtos/migration_dto.dart';
import 'package:chefpartner_mobile/src/interfaces/migration_interface.dart';
import 'package:chefpartner_mobile/src/database/migrations/migration_202304191534_update_country_state.dart';

class DatabaseMigrationRunner {
  final Database _db;
  final MigrationRepository _migrationRepository = MigrationRepository();
  final List<MigrationInterface> _migrations = [UpdateCountryStateMigration()];

  DatabaseMigrationRunner(this._db);

  Future<void> runMigrations() async {
    for (var migration in _migrations) {
      final migrationDB =
          await _migrationRepository.getMigrationByName(migration.getName());

      if (migrationDB != null) {
        return;
      }

      await migration.run(_db);
      await _migrationRepository
          .create(MigrationDTO(name: migration.getName()));
    }
  }
}
