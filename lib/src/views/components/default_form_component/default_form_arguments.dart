import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:flutter/material.dart';

class DefaultFormArguments {
  final GenericDTO model;

  const DefaultFormArguments({
    required this.model,
  });

  static GenericDTO? getEditDTO(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as DefaultFormArguments?;

    return arguments?.model;
  }
}
