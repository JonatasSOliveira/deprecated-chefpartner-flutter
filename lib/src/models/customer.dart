import 'package:chefpatner_mobile/src/models/generic_model.dart';

class Customer extends GenericModel {
  final String? name;
  final String? federalDocument;

  Customer({
    super.id,
    required this.name,
    required this.federalDocument,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });
}
