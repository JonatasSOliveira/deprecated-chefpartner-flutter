import 'package:chefpartner_mobile/src/models/generic_model.dart';

abstract class ValidatorInterface<M extends GenericModel> {
  void createValidation(M model);
}
