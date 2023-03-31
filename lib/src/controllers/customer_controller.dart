import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/models/customer.dart';
import 'package:chefpartner_mobile/src/services/customer_service.dart';

class CustomerController extends GenericController<Customer, CustomerService> {
  CustomerController() : super(service: CustomerService());
}
