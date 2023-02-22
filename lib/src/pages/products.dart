import 'package:flutter/material.dart';

import 'package:chefpatner_mobile/src/components/drawer_container.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerContainer(title: 'Produtos', child: Text('Produtos'));
  }
}
