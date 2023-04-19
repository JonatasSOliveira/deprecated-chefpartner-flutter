import 'package:chefpartner_mobile/src/controllers/customer_address_controller.dart';
import 'package:chefpartner_mobile/src/dtos/customer_address_dto.dart';
import 'package:chefpartner_mobile/src/views/pages/customers/customer_addresses/cusomer_addresses_form_arguments.dart';
import 'package:chefpartner_mobile/src/views/pages/customers/customer_addresses/customer_addresses_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chefpartner_mobile/src/controllers/customer_controller.dart';
import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:chefpartner_mobile/src/views/components/default_form/default_form_state.dart';
import 'package:chefpartner_mobile/src/views/input_formatters/cpf_cnpj_mask_text_input_formatter.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/views/components/default_form/default_form_component.dart';

class CustomerForm extends StatefulWidget {
  static const String _routeName = '/customer_form';

  const CustomerForm({super.key});

  static String getRouteName() {
    return _routeName;
  }

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends DefaultFormState<CustomerForm, CustomerDTO> {
  String _name = '';
  String _federalDocument = '';
  List<CustomerAddressDTO> _addresses = [];
  CustomerDTO? _customer;

  final GlobalKey<DefaultFormComponentState> _defaultFromComponentKey =
      GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _federalDocumentController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadAddress() async {
    if (_customer == null) return;

    final addresses = await CustomerAddressController()
        .listAllByCustomerId(_customer?.getId());
    setState(() {
      _addresses = addresses;
    });
  }

  @override
  void initInputs(CustomerDTO customer) {
    _customer = customer;
    _nameController.text = customer.getName();
    _federalDocumentController.text = customer.getFederalDocument();
    _loadAddress();
    setState(() {
      _name = customer.getName();
      _federalDocument = customer.getFederalDocument();
    });
  }

  CustomerDTO _getDTOWithValues() {
    return CustomerDTO(name: _name, federalDocument: _federalDocument);
  }

  Future<void> _openCustomerAddressForm() async {
    if (_customer == null) {
      try {
        _defaultFromComponentKey.currentState?.saveModel();
      } catch (e) {
        return;
      }
    }

    await Navigator.pushNamed(context, CustomerAddressesForm.getRouteName(),
        arguments: CustomerAddressesFormArguments(
            customer: _customer!, customerAddress: null));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
        key: _defaultFromComponentKey,
        title: I18n.strings.customer.formTitle,
        controller: CustomerController(),
        getDTOWithValues: _getDTOWithValues,
        children: [
          Row(children: [
            Expanded(
                child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  label: Text(I18n.strings.general.name), hintText: ''),
              onChanged: (value) => setState(() => _name = value),
            )),
          ]),
          Row(children: [
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(18),
                CpfCnpjMaskTextInputFormatter()
              ],
              controller: _federalDocumentController,
              decoration: InputDecoration(
                  label: Text(I18n.strings.customer.federalDocument),
                  hintText: ''),
              onChanged: (value) => setState(() => _federalDocument = value),
            ))
          ]),
          Row(
            children: [
              Expanded(
                  child: Center(
                child: ElevatedButton(
                  onPressed: _openCustomerAddressForm,
                  child: const Text("Novo Endereço"),
                ),
              ))
            ],
          )
        ]);
  }
}
