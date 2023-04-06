import 'package:chefpartner_mobile/src/i18n/app_strings.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/components/drawer_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerContainer(
        title: AppStrings.getString('home', 'title'),
        child: const Text('Home'));
  }
}
