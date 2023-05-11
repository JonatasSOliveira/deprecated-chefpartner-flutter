import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/apis/firebase_database/enterprise_fdb.dart';
import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
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
  final EnterpriseController _enterpriseController = EnterpriseController();
  final EnterpriseFDB _enterpriseFDB = EnterpriseFDB();
  String _fantasyName = '';
  String _businessName = '';
  String _federalDocument = '';

  @override
  void initInputs(EnterpriseDTO paymentMethod) {}

  Future<void> _saveEnterprise(_, GenericDTO enterprise) async {
    enterprise as EnterpriseDTO;
    final String newEnterpriseId = _enterpriseFDB.create(enterprise);
    enterprise.setFirebaseId(newEnterpriseId);
    _enterpriseController.create(enterprise);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormComponent(
      title: I18n.strings.enterprise.formTitle,
      controller: _enterpriseController,
      customSaveModel: _saveEnterprise,
      getDTOWithValues: () => EnterpriseDTO(
          businessName: _businessName,
          fantasyName: _fantasyName,
          federalDocument: _federalDocument),
      children: [
        Row(children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                label: Text(I18n.strings.enterprise.fantasyName),
              ),
              onChanged: (value) => setState(() => _fantasyName = value),
            ),
          ),
        ]),
        Row(children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                label: Text(I18n.strings.enterprise.businessName),
              ),
              onChanged: (value) => setState(() => _businessName = value),
            ),
          ),
        ]),
        Row(children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                label: Text(I18n.strings.enterprise.federalDocument),
              ),
              onChanged: (value) => setState(() => _federalDocument = value),
            ),
          )
        ])
      ],
    );
  }
}
