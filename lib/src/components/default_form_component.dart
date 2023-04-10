import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';
import 'package:flutter/material.dart';

class DefaultFormArguments {
  final GenericModel model;

  const DefaultFormArguments({
    required this.model,
  });

  static GenericModel? getEditModel(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as DefaultFormArguments?;

    return arguments?.model;
  }
}

class DefaultFormComponent extends StatelessWidget {
  final String title;
  final VoidCallback onConfirm;
  final List<Widget> children;

  const DefaultFormComponent({
    Key? key,
    required this.title,
    required this.onConfirm,
    required this.children,
  }) : super(key: key);

  void _closeForm(BuildContext context) => Navigator.of(context).pop();

  void _cancelForm(BuildContext context) => _closeForm(context);

  void _confirmForm(BuildContext context) {
    onConfirm();
    _closeForm(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  ...children,
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
