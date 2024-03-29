import 'package:chefpartner_mobile/src/interfaces/model_interface.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';
import 'package:chefpartner_mobile/src/models/generic_model/query_options.dart';

abstract class GenericModel implements ModelInterface {
  final String _tableName;
  final List<Attribute> _attributes;

  GenericModel({
    required String tableName,
    required List<Attribute> attributes,
  })  : _tableName = tableName,
        _attributes = attributes;

  String _getAtributesDefinitionScript() => _attributes
      .map((attribute) => ''',${attribute.name} ${attribute.type.sqlType} 
          ${!attribute.isNulable ? 'NOT ' : ''}NULL''')
      .join('\n');

  String _getForeignKeysDefinitionScript() {
    final fkAttributes =
        _attributes.where((attribute) => attribute.isForeignKey);

    if (fkAttributes.isEmpty) {
      return '';
    }

    return ''',${fkAttributes.map((attribute) => '''FOREIGN KEY (${attribute.name}) 
      REFERENCES ${attribute.getForeignTableName()}(${attribute.foreignColumn})''').join('\n')}''';
  }

  @override
  String getTableName() => _tableName;

  @override
  String getCreateTableScript() => '''
      CREATE TABLE IF NOT EXISTS $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT
        ${_getAtributesDefinitionScript()}
        ,created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ,updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ,deleted_at TIMESTAMP
        ${_getForeignKeysDefinitionScript()}
      );
    ''';

  @override
  String getInsertScript(List<String> attributes) => '''
      INSERT INTO $_tableName (
        ${attributes.join(",")}
      ) VALUES (
        ${attributes.map((attribute) => '?').join(',')}
      );
    ''';

  @override
  String getSelectScript({QueryOptions? queryOptions}) =>
      'SELECT * FROM $_tableName WHERE deleted_at IS NULL ${queryOptions?.toSql() ?? ''}';

  @override
  String getUpdateScript(List<String> attributes) => '''
      UPDATE $_tableName
      SET ${attributes.map((attribute) => '$attribute = ?').join(',')}
      WHERE id = ?;
    ''';

  @override
  String getSoftDeleteScript() => '''
      UPDATE $_tableName
      SET deleted_at = CURRENT_TIMESTAMP
      WHERE id = ?;
    ''';
}
