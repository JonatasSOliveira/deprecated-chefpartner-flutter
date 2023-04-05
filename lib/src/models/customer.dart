import 'package:chefpartner_mobile/src/models/generic_model.dart';

class Customer extends GenericModel {
  String _name = '';
  String? federalDocument;

  Customer({
    super.id,
    required String name,
    required this.federalDocument,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  }) : _name = name;

  Customer.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _name = map['name'];
  }

  String getName() => _name;
}
