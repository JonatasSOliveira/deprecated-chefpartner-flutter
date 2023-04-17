import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:flutter/widgets.dart';

class CustomerAddressesFormArguments {
  final CustomerDTO _customer;

  CustomerAddressesFormArguments({required CustomerDTO customer})
      : _customer = customer;

  static CustomerDTO? getCustomerId(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments
        as CustomerAddressesFormArguments?;

    return arguments?._customer;
  }
}
