import 'package:chefpartner_mobile/src/repositories/customer_repository.dart';
import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class CustomerService extends GenericService<CustomerDTO, CustomerRepository> {
  CustomerService() : super(repository: CustomerRepository());
}
