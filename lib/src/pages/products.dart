import 'package:chefpartner_mobile/src/controllers/product_controller.dart';
import 'package:chefpartner_mobile/src/models/product.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/components/default_list_component.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultListComponent<Product>(
        title: 'Produtos',
        buttonText: 'Novo Produto',
        formRouteName: '/product_form',
        controller: ProductController(),
        getModelDisplayValue: (product) => product.getName());
  }
}
