import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:chefpartner_mobile/src/views/components/default_form_component/default_form_arguments.dart';

abstract class DefaultFormState<T extends StatefulWidget,
    DTO extends GenericDTO> extends State<T> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    DTO? product = DefaultFormArguments.getEditDTO(context) as DTO?;

    if (product != null) {
      initInputs(product);
    }
  }

  void initInputs(DTO dto);
}
