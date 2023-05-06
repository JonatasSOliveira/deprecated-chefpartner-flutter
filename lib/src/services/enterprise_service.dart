import 'package:chefpartner_mobile/src/repositories/enterprise_repository.dart';
import 'package:chefpartner_mobile/src/dtos/enterprise_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class EnterpriseService
    extends GenericService<EnterpriseDTO, EnterpriseRepository> {
  EnterpriseService() : super(repository: EnterpriseRepository());

  Future<bool> verifyIsCreated() async {
    final enterprise = await getRepository().findFirstEnterprise();
    return enterprise != null;
  }
}
