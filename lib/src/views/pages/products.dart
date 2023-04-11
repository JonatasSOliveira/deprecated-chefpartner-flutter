import 'package:chefpartner_mobile/src/controllers/product_controller.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/views/components/default_list_component.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultListComponent<ProductDTO>(
        title: I18n.strings.product.pluralName,
        buttonText: I18n.strings.product.newRegister,
        formRouteName: '/product_form',
        controller: ProductController(),
        getModelDisplayValue: (product) => product.getName());
  }
}
