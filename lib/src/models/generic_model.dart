class GenericModel {
  final dynamic id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  GenericModel({
    this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
}
