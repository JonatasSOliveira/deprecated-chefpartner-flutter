import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:chefpartner_mobile/src/dtos/customer_address_dto.dart';
import 'package:chefpartner_mobile/src/views/pages/customers/customer_addresses/cusomer_addresses_form_arguments.dart';
import 'package:chefpartner_mobile/src/views/components/default_form/default_form_state.dart';

class CustomerAddressesForm extends StatefulWidget {
  const CustomerAddressesForm({super.key});

  @override
  State<CustomerAddressesForm> createState() => _CustomerAddressesFormState();
}

class _CustomerAddressesFormState
    extends DefaultFormState<CustomerAddressesForm, CustomerAddressDTO> {
  late final CustomerDTO _customer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final customer = CustomerAddressesFormArguments.getCustomerId(context);
    if (customer != null) {
      _customer = customer;
    }
  }

  @override
  void initInputs(CustomerAddressDTO customerAddress) {}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
