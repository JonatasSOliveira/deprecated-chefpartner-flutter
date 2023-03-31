import 'package:chefpartner_mobile/src/components/drawer_container.dart';
import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:flutter/material.dart';

class DefaultListComponent extends StatefulWidget {
  final String title;
  final String buttonText;
  final String formRouteName;
  final GenericController _controller;

  const DefaultListComponent({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.formRouteName,
    required GenericController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  State<DefaultListComponent> createState() => _DefaultListComponentState();
}

class _DefaultListComponentState extends State<DefaultListComponent> {
  @override
  void initState() {
    super.initState();
    widget._controller.listAll().then((list) {
      print(list);
    });
  }

  void _onPressNewItem(BuildContext context) {
    Navigator.pushNamed(context, widget.formRouteName);
  }

  @override
  Widget build(BuildContext context) {
    return DrawerContainer(
        title: widget.title,
        child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          const Text('Nenhum item encontrado'),
          ElevatedButton(
            child: Text(widget.buttonText),
            onPressed: () => _onPressNewItem(context),
          )
        ])));
  }
}
