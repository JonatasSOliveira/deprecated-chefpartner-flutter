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

  const OrderOptions({required String attributeName, OrderDirection? orderDirection }): 
    _attributeName = attributeName, _orderDirection = orderDirection ?? OrderDirection.asc;

  String getScript() => '$_attributeName ${_orderDirection.getDirection()}';
}

class QueryOptions {
  final List<OrderOptions>? _orderBy;

  const QueryOptions({List<OrderOptions>? orderBy}): _orderBy = orderBy;

  String _getOrderByScript() {
    if (_orderBy == null || _orderBy!.isEmpty) return '';

    return ' ORDER BY ${_orderBy!.map((order) => order.getScript()).join(', ')}';
  }

  String getScript() {
    String script = '';
    script += _getOrderByScript();
    return script;
  }
}
