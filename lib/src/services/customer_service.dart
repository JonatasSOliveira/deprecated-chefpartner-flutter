import 'package:chefpartner_mobile/src/dao/customer_dao.dart';
import 'package:chefpartner_mobile/src/models/customer.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class CustomerService extends GenericService<Customer, CustomerDAO> {
  CustomerService() : super(dao: CustomerDAO());
}
