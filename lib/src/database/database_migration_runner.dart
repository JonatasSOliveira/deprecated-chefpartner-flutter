import 'package:sqflite/sqflite.dart';
import 'package:chefpartner_mobile/src/repositories/migration_repository.dart';
import 'package:chefpartner_mobile/src/dtos/migration_dto.dart';
import 'package:chefpartner_mobile/src/interfaces/migration_interface.dart';
import 'package:chefpartner_mobile/src/database/migrations/migration_202304191534_initial_migration.dart';

class DatabaseMigrationRunner {
  final Database _db;
  final MigrationRepository _migrationRepository = MigrationRepository();
  final List<MigrationInterface> _migrations = [InitialMigrationMigration()];

  DatabaseMigrationRunner(this._db);

  Future<void> runMigrations() async {
    final lastMigration = await _migrationRepository.findLastMigration();
    final indexLastMigration = _migrations.indexWhere(
        (migration) => migration.getName() == lastMigration?.getName());
    final pendingMigrations = indexLastMigration > -1
        ? _migrations.sublist(indexLastMigration)
        : _migrations;
    for (var migration in pendingMigrations) {
      await migration.run(_db);
      await _migrationRepository
          .create(MigrationDTO(name: migration.getName()));
    }
  }
}
