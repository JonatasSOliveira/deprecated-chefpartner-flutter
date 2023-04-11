import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class CustomerAddressDTO extends GenericDTO {
  CustomerDTO? customer;
  String? address;
  String? city;
  String? state;
  String? number;
  String? complement;
  String? referencePoint;

  CustomerAddressDTO({
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

  CustomerAddressDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    customer =
        map['customer'] != null ? CustomerDTO.fromMap(map['customer']) : null;
  }
}
