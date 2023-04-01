import 'package:chefpartner_mobile/src/components/drawer_container.dart';
import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';
import 'package:flutter/material.dart';

class DefaultListComponent<M extends GenericModel> extends StatefulWidget {
  final String title;
  final String buttonText;
  final String formRouteName;
  final GenericController _controller;
  final String Function(M model) _getModelDisplayValue;

  const DefaultListComponent(
      {Key? key,
      required this.title,
      required this.buttonText,
      required this.formRouteName,
      required GenericController controller,
      required String Function(M) getModelDisplayValue})
      : _getModelDisplayValue = getModelDisplayValue,
        _controller = controller,
        super(key: key);

  @override
  State<DefaultListComponent> createState() => _DefaultListComponentState();

  String getModelDisplayValue(GenericModel model) =>
      _getModelDisplayValue(model as M);
}

class _DefaultListComponentState extends State<DefaultListComponent> {
  List<GenericModel> _modelsList = [];

  @override
  void initState() {
    super.initState();
    widget._controller.listAll().then((list) {
      setState(() {
        _modelsList = list;
      });
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
          if (_modelsList.isNotEmpty)
            Expanded(
                child: ListView.builder(
                    itemCount: _modelsList.length,
                    itemBuilder: (context, index) => ListTile(
                            title: Text(
                          widget.getModelDisplayValue(_modelsList[index]),
                        ))))
          else
            const Text('Nenhum item encontrado'),
          const Text('Nenhum item encontrado'),
          ElevatedButton(
            child: Text(widget.buttonText),
            onPressed: () => _onPressNewItem(context),
          )
        ])));
  }
}
