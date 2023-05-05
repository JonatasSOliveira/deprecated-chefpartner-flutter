import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class EnterpriseDTO extends GenericDTO {
  String _firebaseId = '';
  String _fantasyName = '';
  String _businessName = '';
  String _federalDocument = '';

  EnterpriseDTO({
    String firebaseId = '',
    String fantasyName = '',
    String businessName = '',
    String federalDocument = '',
  }) {
    _firebaseId = firebaseId;
    _fantasyName = fantasyName;
    _businessName = businessName;
    _federalDocument = federalDocument;
  }

  EnterpriseDTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    _firebaseId = map['firebase_id'];
    _fantasyName = map['fantasy_name'];
    _businessName = map['business_name'];
  }

  Map<String, dynamic> toMap() {
    return {
      'fantasy_name': _fantasyName,
      'business_name': _businessName,
      'federal_document': _federalDocument
    };
  }

  void setFirebaseId(String firebaseId) => _firebaseId = firebaseId;

  String getFirebaseId() => _firebaseId;

  String getFantasyName() => _fantasyName;

  String getBusinessName() => _businessName;

  getFederalDocument() => _federalDocument;
}
