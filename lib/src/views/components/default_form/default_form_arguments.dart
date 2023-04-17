import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:flutter/material.dart';

class DefaultFormArguments {
  final GenericDTO _model;

  const DefaultFormArguments({
    required GenericDTO model,
  }) : _model = model;

  static GenericDTO? getEditDTO(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as DefaultFormArguments?;

    return arguments?._model;
  }
}
