enum AttributeType {
  integer('INTEGER'),
  text('TEXT'),
  blob('BLOB'),
  real('REAL'),
  double('DOUBLE'),
  boolean('BOOLEAN'),
  date('DATE'),
  time('TIME'),
  datetime('DATETIME'),
  timestamp('TIMESTAMP');

  final String _type;
  const AttributeType(this._type);

  get sqlType => _type;
}

class Attribute {
  final String name;
  final AttributeType type;
  final bool isNulable;
  final bool isForeignKey;
  final String? foreignTable;
  final String? foreignColumn;

  Attribute(
      {required this.name,
      required this.type,
      this.isNulable = false,
      this.isForeignKey = false,
      this.foreignTable,
      this.foreignColumn = 'id'});
}

abstract class GenericModel {
  final String _tableName;
  final List<Attribute> _attributes;

  GenericModel({
    required String tableName,
    required List<Attribute> attributes,
  })  : _tableName = tableName,
        _attributes = attributes;

  String _getAtributesDefinitionScript() => _attributes
      .map((attribute) =>
          ',${attribute.name} ${attribute.type.sqlType} ${!attribute.isNulable ? 'NOT ' : ''}NULL')
      .join('\n');

  String _getForeignKeysDefinitionScript() {
    final fkAttributes =
        _attributes.where((attribute) => attribute.isForeignKey);

    if (fkAttributes.isEmpty) {
      return '';
    }

    return ',${fkAttributes.map((attribute) => 'FOREIGN KEY (${attribute.name}) REFERENCES ${attribute.foreignTable}(${attribute.foreignColumn})').join('\n')}';
  }

  String getTableName() => _tableName;

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

  String getInsertScript(List<String> attributes) => '''
      INSERT INTO $_tableName (
        ${attributes.join(",")}
      ) VALUES (
        ${attributes.map((attribute) => '?').join(',')}
      );
    ''';

  String getSelectAllScript() =>
      'SELECT * FROM $_tableName WHERE deleted_at IS NULL';

  String getUpdateScript(List<String> attributes) => '''
      UPDATE $_tableName
      SET ${attributes.map((attribute) => '$attribute = ?').join(',')}
      WHERE id = ?;
    ''';

  String getSoftDeleteScript() => '''
      UPDATE $_tableName
      SET deleted_at = CURRENT_TIMESTAMP
      WHERE id = ?;
    ''';
}
