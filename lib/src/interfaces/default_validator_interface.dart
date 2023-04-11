import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

abstract class DefaultValidatorInterface<M extends GenericDTO> {
  void createUpdateValidation(M model);
}
