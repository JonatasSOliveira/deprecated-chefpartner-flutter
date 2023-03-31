import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/database_models/generic_dm.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';

abstract class GenericService<M extends GenericModel,
    DAO extends GenericDAO<GenericDM, M>> {
  late final DAO _dao;

  GenericService({required DAO dao}) : _dao = dao;

  Future<void> create(M model) async {
    await _dao.create(model);
  }

  Future<List<M>> listAll() async {
    return await _dao.listAll();
  }
}
