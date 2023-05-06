import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';
import 'package:chefpartner_mobile/src/dtos/enterprise_dto.dart';
import 'package:chefpartner_mobile/src/services/enterprise_service.dart';

class EnterpriseController
    extends GenericController<EnterpriseDTO, EnterpriseService> {
  EnterpriseController() : super(service: EnterpriseService());

  Future<bool> verifyIsCreated() async {
    return await getService().verifyIsCreated();
  }
}
