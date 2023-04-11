import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';
import 'package:chefpartner_mobile/src/exceptions/validation_exception.dart';
import 'package:chefpartner_mobile/src/interfaces/default_validator_interface.dart';
import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:chefpartner_mobile/src/views/dialogs/generic_dialog.dart';

abstract class GenericService<M extends GenericDTO,
    DAO extends GenericDAO<GenericModel, M>> {
  final DAO _dao;
  final DefaultValidatorInterface<M>? _validator;

  GenericService({required DAO dao, DefaultValidatorInterface<M>? validator})
      : _dao = dao,
        _validator = validator;

  Future<void> create(M model) async {
    try {
      _validator?.createUpdateValidation(model);
      await _dao.create(model);
    } on ValidationException catch (e) {
      GenericDialog.showAlertDialog(e.toString());
    }
  }

  Future<void> update(dynamic modelId, M model) async {
    try {
      _validator?.createUpdateValidation(model);
      await _dao.update(modelId, model);
    } on ValidationException catch (e) {
      GenericDialog.showAlertDialog(e.toString());
    }
  }

  Future<List<M>> listAll() async => await _dao.listAll();

  Future<void> softDelete(dynamic modelId) async =>
      await _dao.softDelete(modelId);
}
