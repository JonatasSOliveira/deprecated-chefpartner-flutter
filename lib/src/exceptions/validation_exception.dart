class ValidationException implements Exception {
  final String _message;

  ValidationException(message) : _message = message;

  @override
  String toString() {
    return _message;
  }
}
