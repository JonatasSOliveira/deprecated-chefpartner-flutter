import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:chefpartner_mobile/src/views/components/default_form_component/default_form_arguments.dart';
import 'package:flutter/material.dart';

class DefaultFormComponent<DTO extends GenericDTO> extends StatefulWidget {
  final String _title;
  final List<Widget> _children;
  final GenericController _controller;
  final DTO Function() _getDTOWithValues;

  const DefaultFormComponent(
      {Key? key,
      required String title,
      required List<Widget> children,
      required GenericController controller,
      required DTO Function() getDTOWithValues})
      : _title = title,
        _children = children,
        _controller = controller,
        _getDTOWithValues = getDTOWithValues,
        super(key: key);

  @override
  State<DefaultFormComponent> createState() =>
      _DefaultFormComponentState<DTO>();
}

class _DefaultFormComponentState<DTO extends GenericDTO>
    extends State<DefaultFormComponent> {
  dynamic _id;

  void _closeForm(BuildContext context) => Navigator.of(context).pop();

  void _cancelForm(BuildContext context) => _closeForm(context);

  Future<void> _saveModel() async {
    if (_id == null) {
      await widget._controller.create(widget._getDTOWithValues());
      return;
    }

    await widget._controller.update(_id, widget._getDTOWithValues());
  }

  void _confirmForm(BuildContext context) {
    _saveModel().then((_) => _closeForm(context));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    GenericDTO? dto = DefaultFormArguments.getEditDTO(context);
    if (dto != null) {
      _id = dto.getId();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._title),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  ...widget._children,
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () => _cancelForm(context),
                          child: Text(I18n.strings.general.cancel)),
                      ElevatedButton(
                          onPressed: () => _confirmForm(context),
                          child: Text(I18n.strings.general.confirm)),
                    ],
                  ),
                ]))));
  }
}
