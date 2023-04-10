import 'package:chefpartner_mobile/src/controllers/product_controller.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/components/default_form_component.dart';
import 'package:chefpartner_mobile/src/i18n/app_strings.dart';
import 'package:chefpartner_mobile/src/models/product.dart';

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
    Product? product = DefaultFormArguments.getEditModel(context) as Product?;

    if (product != null) {
      _initializeEdition(product);
    }
  }

  void _initializeEdition(Product product) {
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
        Product(name: _name, description: _description, price: _price);

    if (_id != null) {
      await ProductController().update(_id, product);
      return;
    }

    await ProductController().create(product);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
        title: AppStrings.strings.product.formTitle,
        onConfirm: _saveProductForm,
        children: [
          Row(children: [
            Expanded(
                child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                label: Text(AppStrings.strings.general.name),
                hintText: '',
              ),
              onChanged: (value) => setState(() => _name = value),
            )),
            Expanded(
                child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                label: Text(AppStrings.strings.general.description),
                hintText: '',
              ),
              onChanged: (value) => setState(() => _description = value),
            ))
          ])
        ]);
  }
}
