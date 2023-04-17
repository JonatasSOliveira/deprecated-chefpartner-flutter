import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/dtos/customer_address_dto.dart';
import 'package:chefpartner_mobile/src/services/customer_address_service.dart';

class CustomerAddressController
    extends GenericController<CustomerAddressDTO, CustomerAddressService> {
  CustomerAddressController() : super(service: CustomerAddressService());

  Future<List<CustomerAddressDTO>> listAllByCustomerId(dynamic customerId) {
    return getService().listAllByCustomerId(customerId);
  }
}
