import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';

abstract class GenericService<M extends GenericModel, DAO extends GenericDAO> {
  late final DAO _dao;

  GenericService({required DAO dao}) : _dao = dao;

  void validateModel(M model);

  Future<void> create(M model) async {
    validateModel(model);

    await _dao.create(model);
  }
}
