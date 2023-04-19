import 'package:chefpartner_mobile/src/dtos/customer_address_dto.dart';
import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:chefpartner_mobile/src/views/components/default_form/default_form_arguments.dart';
import 'package:flutter/widgets.dart';

class CustomerAddressesFormArguments extends DefaultFormArguments {
  final CustomerDTO _customer;

  CustomerAddressesFormArguments(
      {required CustomerDTO customer,
      required CustomerAddressDTO? customerAddress})
      : _customer = customer,
        super(model: customerAddress);

  static dynamic getCustomer(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments
        as CustomerAddressesFormArguments?;

    return arguments?._customer;
  }
}
