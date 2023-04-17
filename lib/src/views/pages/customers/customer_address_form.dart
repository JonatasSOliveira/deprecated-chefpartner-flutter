import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/dtos/customer_address_dto.dart';
import 'package:chefpartner_mobile/src/views/components/default_form/default_form_state.dart';

class CustomerAddressFormDart extends StatefulWidget {
  const CustomerAddressFormDart({super.key});

  @override
  State<CustomerAddressFormDart> createState() =>
      _CustomerAddressFormDartState();
}

class _CustomerAddressFormDartState
    extends DefaultFormState<CustomerAddressFormDart, CustomerAddressDTO> {
  @override
  void initInputs(CustomerAddressDTO customerAddress) {}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
