import 'package:chefpartner_mobile/src/models/customer.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';

class CustomerAddress extends GenericModel {
  Customer? customer;
  String? address;
  String? city;
  String? state;
  String? number;
  String? complement;
  String? referencePoint;

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

  CustomerAddress.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    customer =
        map['customer'] != null ? Customer.fromMap(map['customer']) : null;
  }
}
