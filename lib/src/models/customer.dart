import 'package:chefpartner_mobile/src/models/generic_model.dart';

class Customer extends GenericModel {
  String? name;
  String? federalDocument;

  Customer({
    super.id,
    required this.name,
    required this.federalDocument,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Customer.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    name = map['name'];
  }
}
