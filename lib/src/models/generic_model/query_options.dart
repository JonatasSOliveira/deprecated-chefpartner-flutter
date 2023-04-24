enum OrderDirection {
  asc('ASC'),
  desc('DESC');

  final String _direction;

  const OrderDirection(this._direction);

  String getDirection() => _direction;
}

class OrderOptions {
  final String _attributeName;
  final OrderDirection _orderDirection;

  const OrderOptions(
      {required String attributeName, OrderDirection? orderDirection})
      : _attributeName = attributeName,
        _orderDirection = orderDirection ?? OrderDirection.asc;

  String toSql() => '$_attributeName ${_orderDirection.getDirection()}';
}

class QueryOptions {
  final List<OrderOptions>? _orderBy;
  final int? _limit;

  const QueryOptions({List<OrderOptions>? orderBy, int? limit})
      : _orderBy = orderBy,
        _limit = limit;

  String _orderByToSql() {
    if (_orderBy == null || _orderBy!.isEmpty) return '';

    return ' ORDER BY ${_orderBy!.map((order) => order.toSql()).join(', ')}';
  }

  String _limitToSql() {
    if (_limit == null) return '';
    return ' LIMIT $_limit';
  }

  String toSql() {
    String script = '';
    script += _orderByToSql();
    script += _limitToSql();
    return script;
  }
}
