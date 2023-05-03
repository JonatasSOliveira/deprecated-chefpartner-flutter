import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class EnterpriseDTO extends GenericDTO {
  String _uuid = '';
  String _fantasyName = '';
  String _businessName = '';

  EnterpriseDTO({
    String uuid = '',
    String fantasyName = '',
    String businessName = '',
  }) {
    _uuid = uuid;
    _fantasyName = fantasyName;
    _businessName = businessName;
  }

  EnterpriseDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _uuid = map['uuid'];
    _fantasyName = map['fantasy_name'];
    _businessName = map['business_name'];
  }

  getUuid() => _uuid;

  getFantasyName() => _fantasyName;

  getBusinessName() => _businessName;
}
