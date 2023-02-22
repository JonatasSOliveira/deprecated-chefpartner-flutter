import 'package:flutter/material.dart';

import 'package:chefpatner_mobile/src/components/drawer_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerContainer(title: 'ChefPatner', child: Text('Home'));
  }
}
