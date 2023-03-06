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

  final String type;
  const AttributeType(this.type);

  get sqlType => type;
}

class Attribute {
  final String name;
  final AttributeType type;
  final bool isNulable;

  Attribute({required this.name, required this.type, this.isNulable = false});
}

abstract class GenericModel {
  late final String _tableName;
  late final List<Attribute> _attributes;

  final dynamic id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  GenericModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  GenericModel.defineSQL(String tableName, List<Attribute> attributes)
      : id = null,
        createdAt = null,
        updatedAt = null,
        deletedAt = null,
        _tableName = tableName,
        _attributes = attributes;

  String _getAtributeScript(Attribute attribute) {
    return '${attribute.name} ${attribute.type.sqlType} ${!attribute.isNulable ? 'NOT' : ''} NULL';
  }

  String getCreateTableScript() {
    return '''
      CREATE TABLE IF NOT EXISTS $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ${_attributes.map((attribute) => _getAtributeScript(attribute)).join(',\n')},
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        deleted_at TIMESTAMP
      );
    ''';
  }
}
