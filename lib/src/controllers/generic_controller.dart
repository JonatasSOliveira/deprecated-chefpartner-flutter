import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/database_models/generic_dm.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

abstract class GenericController<M extends GenericModel,
    S extends GenericService<M, GenericDAO<GenericDM, M>>> {
  final S _service;

  GenericController({required S service}) : _service = service;

  Future<void> create(M model) async {
    await _service.create(model);
  }

  Future<void> update(dynamic modelId, M model) async {
    await _service.update(modelId, model);
  }

  Future<List<M>> listAll() async {
    return await _service.listAll();
  }
}
