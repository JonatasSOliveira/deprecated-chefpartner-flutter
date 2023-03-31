abstract class GenericModel {
  dynamic id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  GenericModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  GenericModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    createdAt = DateTime.parse(map['created_at']);
    updatedAt = DateTime.parse(map['updated_at']);
    deletedAt =
        map['deleted_at'] != null ? DateTime.parse(map['deleted_at']) : null;
  }
}
