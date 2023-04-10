import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/components/drawer_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerContainer(
        title: I18n.strings.home.singularName, child: const Text('Home'));
  }
}
