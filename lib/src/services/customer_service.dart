import 'package:chefpartner_mobile/src/dao/customer_dao.dart';
import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class CustomerService extends GenericService<CustomerDTO, CustomerDAO> {
  CustomerService() : super(dao: CustomerDAO());
}
