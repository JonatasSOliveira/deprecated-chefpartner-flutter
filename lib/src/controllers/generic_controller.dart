import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';
import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

abstract class GenericController<M extends GenericDTO,
    S extends GenericService<M, GenericDAO<GenericModel, M>>> {
  final S _service;

  @protected
  S getService() => _service;

  GenericController({required S service}) : _service = service;

  Future<void> create(M model) async => await _service.create(model);

  Future<void> update(dynamic modelId, M model) async =>
      await _service.update(modelId, model);

  Future<List<M>> listAll() async => await _service.listAll();

  Future<void> softDelete(dynamic modelId) async =>
      await _service.softDelete(modelId);
}
