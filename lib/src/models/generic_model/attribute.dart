import 'package:chefpartner_mobile/src/interfaces/model_interface.dart';

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
  final ModelInterface? _foreignTable;
  final String? foreignColumn;

  Attribute(
      {required this.name,
      required this.type,
      this.isNulable = false,
      ModelInterface? foreignTable,
      this.foreignColumn = 'id'})
      : _foreignTable = foreignTable,
        isForeignKey = foreignTable != null;

  String getForeignTableName() => _foreignTable?.getTableName() ?? '';
}
