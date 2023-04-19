import 'package:chefpartner_mobile/src/controllers/customer_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:chefpartner_mobile/src/dtos/customer_address_dto.dart';
import 'package:chefpartner_mobile/src/views/pages/customers/customer_addresses/cusomer_addresses_form_arguments.dart';
import 'package:chefpartner_mobile/src/views/components/default_form/default_form_state.dart';
import 'package:chefpartner_mobile/src/views/components/default_form/default_form_component.dart';

class CustomerAddressesForm extends StatefulWidget {
  static const String _route = '/customer/address';

  static String getRouteName() => _route;

  const CustomerAddressesForm({super.key});

  @override
  State<CustomerAddressesForm> createState() => _CustomerAddressesFormState();
}

class _CustomerAddressesFormState
    extends DefaultFormState<CustomerAddressesForm, CustomerAddressDTO> {
  late final CustomerDTO _customer;
  String _address = '';
  String _city = '';
  String _state = '';
  String _number = '';
  String _complement = '';
  String _referencePoint = '';

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();
  final TextEditingController _referencePointController =
      TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final customer = CustomerAddressesFormArguments.getCustomer(context);
    if (customer != null) {
      _customer = customer;
    }
  }

  @override
  void initInputs(CustomerAddressDTO customerAddress) {
    setState(() {
      _address = customerAddress.getAddress();
      _city = customerAddress.getCity();
      _state = customerAddress.getState();
      _number = customerAddress.getNumber() ?? '';
      _complement = customerAddress.getComplement() ?? '';
      _referencePoint = customerAddress.getReferencePoint() ?? '';
    });
  }

  CustomerAddressDTO _getDTOWithValues() => CustomerAddressDTO(
      customer: _customer,
      address: _address,
      city: _city,
      state: _state,
      number: _number,
      complement: _complement,
      referencePoint: _referencePoint);

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
      controller: CustomerAddressController(),
      getDTOWithValues: _getDTOWithValues,
      title: 'Novo Endereço',
      children: [
        Row(children: [
          Expanded(
              child: TextField(
            controller: _addressController,
            decoration:
                const InputDecoration(label: Text('Endereço'), hintText: ''),
            onChanged: (value) => setState(() => _address = value),
          )),
        ]),
        Row(children: [
          Expanded(
              child: TextField(
            controller: _cityController,
            decoration:
                const InputDecoration(label: Text('Cidade'), hintText: ''),
            onChanged: (value) => setState(() => _city = value),
          )),
        ]),
        Row(children: [
          Expanded(
              child: TextField(
            controller: _stateController,
            decoration:
                const InputDecoration(label: Text('Estado'), hintText: ''),
            onChanged: (value) => setState(() => _state = value),
          )),
        ]),
        Row(children: [
          Expanded(
              child: TextField(
            controller: _numberController,
            decoration:
                const InputDecoration(label: Text('Número'), hintText: ''),
            onChanged: (value) => setState(() => _number = value),
          )),
        ]),
        Row(children: [
          Expanded(
              child: TextField(
            controller: _complementController,
            decoration:
                const InputDecoration(label: Text('Complemento'), hintText: ''),
            onChanged: (value) => setState(() => _complement = value),
          )),
        ]),
        Row(children: [
          Expanded(
              child: TextField(
            controller: _referencePointController,
            decoration: const InputDecoration(
                label: Text('Ponto de Referência'), hintText: ''),
            onChanged: (value) => setState(() => _referencePoint = value),
          )),
        ]),
      ],
    );
  }
}
