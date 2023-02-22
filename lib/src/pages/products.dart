import 'package:flutter/material.dart';

import 'package:chefpatner_mobile/src/components/drawer_container.dart';
import 'package:chefpatner_mobile/src/components/default_list_component.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerContainer(
        title: 'Produtos',
        child: DefaultListComponent(
            buttonText: 'Novo Produto', formRouteName: '/product_form'));
  }
}
