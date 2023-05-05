import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:chefpartner_mobile/src/controllers/enterprise_controller.dart';
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
  final EnterpriseController _controller = EnterpriseController();
  String _fantasyName = '';
  String _businessName = '';
  String _federalDocument = '';

  @override
  void initInputs(EnterpriseDTO paymentMethod) {}

  Future<void> _saveEnterprise(_, GenericDTO enterprise) async {
    enterprise as EnterpriseDTO;
    DatabaseReference firebaseEnterprisesRef =
        FirebaseDatabase.instance.ref('enterprises');
    DatabaseReference newEnterpriseRef = firebaseEnterprisesRef.push();
    String newEnterpriseId = newEnterpriseRef.key!;
    enterprise.setFirebaseId(newEnterpriseId);
    newEnterpriseRef.set(enterprise.toMap());
    _controller.create(enterprise);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
      title: 'Empresa',
      controller: _controller,
      customSaveModel: _saveEnterprise,
      getDTOWithValues: () => EnterpriseDTO(
          businessName: _businessName,
          fantasyName: _fantasyName,
          federalDocument: _federalDocument),
      children: [
        Row(children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                label: Text('Nome Fantasia'),
              ),
              onChanged: (value) => setState(() => _fantasyName = value),
            ),
          ),
        ]),
        Row(children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                label: Text('Razão Social'),
              ),
              onChanged: (value) => setState(() => _businessName = value),
            ),
          ),
        ]),
        Row(children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                label: Text('Documento Federal'),
              ),
              onChanged: (value) => setState(() => _federalDocument = value),
            ),
          )
        ])
      ],
    );
  }
}
