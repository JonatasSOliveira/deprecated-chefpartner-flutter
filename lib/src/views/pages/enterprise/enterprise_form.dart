import 'package:chefpartner_mobile/src/controllers/enterprise_controller.dart';
import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/dtos/enterprise_dto.dart';
import 'package:chefpartner_mobile/src/views/components/default_form/default_form_component.dart';
import 'package:chefpartner_mobile/src/views/components/default_form/default_form_state.dart';

class EnterpriseForm extends StatefulWidget {
  static const String _routeName = '/enterprise_form';

  const EnterpriseForm({super.key});

  static String getRouteName() => _routeName;

  @override
  State<EnterpriseForm> createState() => _EnterpriseFormState();
}

class _EnterpriseFormState
    extends DefaultFormState<EnterpriseForm, EnterpriseDTO> {
  String _fantasyName = '';
  String _businessName = '';

  @override
  void initInputs(EnterpriseDTO paymentMethod) {}

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
      title: 'Empresa',
      controller: EnterpriseController(),
      getDTOWithValues: () =>
          EnterpriseDTO(businessName: _businessName, fantasyName: _fantasyName),
      children: [],
    );
  }
}
