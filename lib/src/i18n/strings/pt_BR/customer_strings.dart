import 'package:chefpartner_mobile/src/interfaces/i18n/strings/customer_strings_interface.dart';

class PtBrCustomerStrings implements CustomerStringsInterface {
  @override
  String get pluralName => 'Clientes';
  @override
  String get singularName => 'Cliente';
  @override
  String get newRegister => 'Novo Cliente';
  @override
  String get formTitle => 'Formulário Cliente';
  @override
  String get federalDocument => 'CPF/CNPJ';
}
