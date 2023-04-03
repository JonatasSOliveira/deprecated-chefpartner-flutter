import 'package:chefpartner_mobile/src/components/default_form_component.dart';
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

  void _openModelCreateForm(BuildContext context) {
    Navigator.pushNamed(context, widget.formRouteName);
  }

  void _openModelEditForm(BuildContext context, GenericModel model) {
    Navigator.pushNamed(context, widget.formRouteName,
        arguments: DefaultFormArguments(model: model));
  }

  Widget renderItemList(BuildContext context) {
    if (_modelsList.isNotEmpty) {
      return Expanded(
          child: ListView.builder(
              itemCount: _modelsList.length,
              itemBuilder: (context, index) => ListTile(
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () =>
                          _openModelEditForm(context, _modelsList[index]),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => {},
                    )
                  ]),
                  title: Text(
                    widget.getModelDisplayValue(_modelsList[index]),
                  ))));
    }

    return const Text('Nenhum item encontrado');
  }

  @override
  Widget build(BuildContext context) {
    return DrawerContainer(
        title: widget.title,
        child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          renderItemList(context),
          ElevatedButton(
            child: Text(widget.buttonText),
            onPressed: () => _openModelCreateForm(context),
          )
        ])));
  }
}
