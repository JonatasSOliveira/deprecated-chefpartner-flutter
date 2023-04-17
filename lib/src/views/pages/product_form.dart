import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/views/components/currency_input_component.dart';
import 'package:chefpartner_mobile/src/controllers/product_controller.dart';
import 'package:chefpartner_mobile/src/extensions/string_extesion.dart';
import 'package:chefpartner_mobile/src/views/components/default_form_component/default_form_state.dart';
import 'package:chefpartner_mobile/src/views/components/default_form_component/default_form_component.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends DefaultFormState<ProductForm, ProductDTO> {
  String _name = '';
  String? _description;
  String _price = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void initInputs(ProductDTO product) {
    _nameController.text = product.getName();
    _descriptionController.text = product.getDescription();
    _priceController.text = product.getPrice().toString();
    setState(() {
      _name = product.getName();
      _description = product.getDescription();
      _price = product.getPrice().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
        title: I18n.strings.product.formTitle,
        controller: ProductController(),
        getDTOWithValues: () => ProductDTO(
            name: _name,
            description: _description,
            price: _price.currencyToInt()),
        children: [
          Row(children: [
            Expanded(
                child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                label: Text(I18n.strings.general.name),
                hintText: '',
              ),
              onChanged: (value) => setState(() => _name = value),
            )),
          ]),
          Row(children: [
            Expanded(
                child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                label: Text(I18n.strings.general.description),
                hintText: '',
              ),
              onChanged: (value) => setState(() => _description = value),
            )),
          ]),
          Row(
            children: [
              Expanded(
                  child: CurrencyInputComponent(
                controller: _priceController,
                decoration: InputDecoration(
                  label: Text(I18n.strings.general.price),
                  hintText: '',
                ),
                onChanged: (value) => setState(() => _price = value),
              ))
            ],
          )
        ]);
  }
}
