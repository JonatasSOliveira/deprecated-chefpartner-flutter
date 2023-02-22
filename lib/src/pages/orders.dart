import 'package:flutter/material.dart';

import 'package:chefpatner_mobile/src/components/drawer_container.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerContainer(title: 'Pedidos', child: Text('Pedidos'));
  }
}
