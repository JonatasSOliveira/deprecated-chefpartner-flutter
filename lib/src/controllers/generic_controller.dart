import 'package:chefpatner_mobile/src/models/generic_model.dart';
import 'package:chefpatner_mobile/src/services/generic_service.dart';

abstract class GenericController<M extends GenericModel,
    S extends GenericService> {
  final S _service;

  GenericController({required S service}) : _service = service;

  Future<void> create(M model) async {
    await _service.create(model);
  }
}
