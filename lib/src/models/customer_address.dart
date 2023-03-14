import 'package:chefpatner_mobile/src/models/customer.dart';
import 'package:chefpatner_mobile/src/models/generic_model.dart';

class CustomerAddress extends GenericModel {
  final Customer? customer;
  final String? address;
  final String? city;
  final String? state;
  final String? number;
  final String? complement;
  final String? referencePoint;

  CustomerAddress({
    super.id,
    required this.customer,
    required this.address,
    required this.city,
    required this.state,
    required this.number,
    this.complement,
    this.referencePoint,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });
}
