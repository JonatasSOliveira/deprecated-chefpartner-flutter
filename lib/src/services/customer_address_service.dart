import 'package:chefpartner_mobile/src/dao/customer_address_dao.dart';
import 'package:chefpartner_mobile/src/dtos/customer_address_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class CustomerAddressService
    extends GenericService<CustomerAddressDTO, CustomerAddressDAO> {
  CustomerAddressService() : super(dao: CustomerAddressDAO());

  Future<List<CustomerAddressDTO>> listAllByCustomerId(
      dynamic customerId) async {
    return [];
  }
}
