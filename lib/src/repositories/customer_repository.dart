import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/models/customer_model.dart';
import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';

class CustomerRepository extends GenericRepository<CustomerModel, CustomerDTO> {
  CustomerRepository()
      : super(
            databaseModel: CustomerModel(),
            defaultInsertAttributes: ['name', 'federal_document']);

  @override
  List<Object?> getAttributesValues(CustomerDTO model) =>
      [model.getName(), model.getFederalDocument()];

  @override
  CustomerDTO fromMap(Map<String, dynamic> map) {
    return CustomerDTO.fromMap(map);
  }
}
