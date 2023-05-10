import 'package:chefpartner_mobile/src/dtos/enterprise_dto.dart';
import 'package:firebase_database/firebase_database.dart';

class EnterpriseFDB {
  final DatabaseReference _enterprisesFDBRef = FirebaseDatabase.instance.ref('enterprises');

  String create(EnterpriseDTO enterprise) {
    final DatabaseReference newEnterpriseFDBRef = _enterprisesFDBRef.push();
    final String enterpriseFDBId = newEnterpriseFDBRef.key!;
    newEnterpriseFDBRef.set(enterprise.toMap());
    return enterpriseFDBId;
  }
}