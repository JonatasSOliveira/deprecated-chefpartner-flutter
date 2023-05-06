import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/controllers/enterprise_controller.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/views/pages/enterprise/enterprise_form.dart';
import 'package:chefpartner_mobile/src/views/components/drawer_container.dart';

class Home extends StatefulWidget {
  static const String _routeName = '/';

  const Home({super.key});

  static String getRouteName() {
    return _routeName;
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    EnterpriseController().verifyIsCreated().then((isCreated) {
      if (!isCreated) {
        Navigator.pushNamed(context, EnterpriseForm.getRouteName());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DrawerContainer(
        title: I18n.strings.home.singularName, child: const Text('Home'));
  }
}
