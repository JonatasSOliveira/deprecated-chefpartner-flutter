import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/components/drawer_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerContainer(title: 'chefpartner', child: Text('Home'));
  }
}
