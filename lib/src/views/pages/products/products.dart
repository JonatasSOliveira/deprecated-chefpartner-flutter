import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/controllers/product_controller.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';
import 'package:chefpartner_mobile/src/views/pages/products/product_form.dart';
import 'package:chefpartner_mobile/src/views/components/default_list_component.dart';

class Products extends StatelessWidget {
  static const String _routeName = '/products';

  const Products({super.key});

  static String getRouteName() {
    return _routeName;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultListComponent<ProductDTO>(
        title: I18n.strings.product.pluralName,
        buttonText: I18n.strings.product.newRegister,
        formRouteName: ProductForm.getRouteName(),
        controller: ProductController(),
        getModelDisplayValue: (product) => product.getName());
  }
}
