import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/database_models/customer_dm.dart';
import 'package:chefpartner_mobile/src/models/customer.dart';

class CustomerDAO extends GenericDAO<CustomerDM, Customer> {
  CustomerDAO()
      : super(databaseModel: CustomerDM(), defaultInsertAttributes: ['name']);

  @override
  List<Object?> getAttributesValues(Customer model) {
    return [model.name];
  }

  @override
  Customer fromMap(Map<String, dynamic> map) {
    return Customer.fromMap(map);
  }
}
