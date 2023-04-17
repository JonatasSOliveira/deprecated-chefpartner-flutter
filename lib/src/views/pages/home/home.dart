import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/views/components/drawer_container.dart';

class Home extends StatelessWidget {
  static const String _routeName = '/';

  const Home({super.key});

  static String getRouteName() {
    return _routeName;
  }

  @override
  Widget build(BuildContext context) {
    return DrawerContainer(
        title: I18n.strings.home.singularName, child: const Text('Home'));
  }
}
