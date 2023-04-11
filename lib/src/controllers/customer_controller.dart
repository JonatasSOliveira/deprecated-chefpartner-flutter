import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:chefpartner_mobile/src/services/customer_service.dart';

class CustomerController
    extends GenericController<CustomerDTO, CustomerService> {
  CustomerController() : super(service: CustomerService());
}
