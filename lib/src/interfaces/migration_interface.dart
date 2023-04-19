import 'package:sqflite/sqflite.dart';

abstract class MigrationInterface {
  String getName();
  Future<void> run(Database db);
}
