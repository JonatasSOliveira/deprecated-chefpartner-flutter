import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/components/default_list_component.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultListComponent(
        title: 'Produtos',
        buttonText: 'Novo Produto',
        formRouteName: '/product_form');
  }
}
