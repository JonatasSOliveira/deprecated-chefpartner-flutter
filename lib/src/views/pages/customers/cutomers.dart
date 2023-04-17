import 'package:chefpartner_mobile/src/controllers/customer_controller.dart';
import 'package:chefpartner_mobile/src/dtos/customer_dto.dart';
import 'package:chefpartner_mobile/src/i18n/i18n.dart';
import 'package:flutter/material.dart';

import 'package:chefpartner_mobile/src/views/components/default_list_component.dart';

class Customers extends StatelessWidget {
  const Customers({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultListComponent<CustomerDTO>(
      title: I18n.strings.customer.pluralName,
      buttonText: I18n.strings.customer.newRegister,
      formRouteName: '/customer_form',
      controller: CustomerController(),
      getModelDisplayValue: (customer) => customer.getName(),
    );
  }
}
