import 'package:chefpartner_mobile/src/repositories/customer_address_repository.dart';
import 'package:chefpartner_mobile/src/dtos/customer_address_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class CustomerAddressService
    extends GenericService<CustomerAddressDTO, CustomerAddressRepository> {
  CustomerAddressService() : super(repository: CustomerAddressRepository());

  Future<List<CustomerAddressDTO>> listAllByCustomerId(
      dynamic customerId) async {
    return [];
  }
}
