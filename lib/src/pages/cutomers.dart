import 'package:flutter/material.dart';

import 'package:chefpatner_mobile/src/components/drawer_container.dart';

class Customers extends StatelessWidget {
  const Customers({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerContainer(title: 'Clientes', child: Text('Clientes'));
  }
}
