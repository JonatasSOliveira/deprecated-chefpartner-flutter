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