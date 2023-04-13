import 'package:chefpartner_mobile/src/views/components/currency_input_component.dart';
import 'package:chefpartner_mobile/src/controllers/product_controller.dart';
import 'package:chefpartner_mobile/src/extensions/string_extesion.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/views/components/default_form_component.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  dynamic _id;
  String _name = '';
  String? _description;
  int _price = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ProductDTO? product =
        DefaultFormArguments.getEditModel(context) as ProductDTO?;

    if (product != null) {
      _initializeEdition(product);
    }
  }

  void _initializeEdition(ProductDTO product) {
    _nameController.text = product.getName();
    _descriptionController.text = product.getDescription();
    _priceController.text = product.getPrice().toString();
    setState(() {
      _id = product.getId();
      _name = product.getName();
      _description = product.getDescription();
      _price = product.getPrice();
    });
  }

  Future<void> _saveProductForm() async {
    final product =
        ProductDTO(name: _name, description: _description, price: _price);

    if (_id != null) {
      await ProductController().update(_id, product);
      return;
    }

    await ProductController().create(product);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
        title: I18n.strings.product.formTitle,
        onConfirm: _saveProductForm,
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
                onChanged: (value) => setState(() => _price = value.toInt()),
              ))
            ],
          )
        ]);
  }
}
