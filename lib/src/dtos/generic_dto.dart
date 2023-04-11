abstract class GenericDTO {
  dynamic _id;
  DateTime? _createdAt;
  DateTime? _updatedAt;
  DateTime? _deletedAt;

  GenericDTO({
    dynamic id,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  })  : _id = id,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _deletedAt = deletedAt;

  GenericDTO.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _createdAt = DateTime.parse(map['created_at']);
    _updatedAt = DateTime.parse(map['updated_at']);
    _deletedAt =
        map['deleted_at'] != null ? DateTime.parse(map['deleted_at']) : null;
  }

  dynamic getId() => _id;

  DateTime? getCreatedAt() => _createdAt;

  DateTime? getUpdatedAt() => _updatedAt;

  DateTime? getDeletedAt() => _deletedAt;
}
