import 'package:chefpartner_mobile/src/controllers/customer_controller.dart';
import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:chefpartner_mobile/src/views/components/default_form_component/default_form_arguments.dart';
import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/views/components/default_form_component/default_form_component.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({super.key});

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  String _name = '';
  String _federalDocument = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _federalDocumentController =
      TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    CustomerDTO? product =
        DefaultFormArguments.getEditDTO(context) as CustomerDTO?;

    if (product != null) {
      _initInputs(product);
    }
  }

  void _initInputs(CustomerDTO customer) {
    _nameController.text = customer.getName();
    _federalDocumentController.text = customer.getFederalDocument();
    setState(() {
      _name = customer.getName();
      _federalDocument = customer.getFederalDocument();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
        title: I18n.strings.customer.formTitle,
        controller: CustomerController(),
        getDTOWithValues: () =>
            CustomerDTO(name: _name, federalDocument: _federalDocument),
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
              controller: _federalDocumentController,
              decoration: InputDecoration(
                  label: Text(I18n.strings.customer.federalDocument),
                  hintText: ''),
              onChanged: (value) => setState(() => _federalDocument = value),
            ))
          ])
        ]);
  }
}
