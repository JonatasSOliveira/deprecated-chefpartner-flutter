import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class CustomerAddressDTO extends GenericDTO {
  CustomerDTO? _customer;
  String _address = '';
  String _city = '';
  String _state = '';
  String? _number;
  String? _complement;
  String? _referencePoint;

  CustomerAddressDTO({
    super.id,
    required CustomerDTO customer,
    required String address,
    required String city,
    required String state,
    required String? number,
    String? complement,
    String? referencePoint,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  })  : _referencePoint = referencePoint,
        _state = state,
        _complement = complement,
        _number = number,
        _city = city,
        _address = address,
        _customer = customer;

  CustomerAddressDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _customer =
        map['customer'] != null ? CustomerDTO.fromMap(map['customer']) : null;
    _address = map['address'];
    _city = map['city'];
    _state = map['state'];
    _number = map['number'];
    _complement = map['complement'];
    _referencePoint = map['referencePoint'];
  }

  CustomerDTO? getCustomer() => _customer;

  String getAddress() => _address;

  String getCity() => _city;

  String getState() => _state;

  String? getNumber() => _number;

  String? getComplement() => _complement;

  String? getReferencePoint() => _referencePoint;
}
