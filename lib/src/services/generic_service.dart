import 'package:chefpartner_mobile/src/dao/generic_dao.dart';
import 'package:chefpartner_mobile/src/database_models/generic_dm.dart';
import 'package:chefpartner_mobile/src/exceptions/validation_exception.dart';
import 'package:chefpartner_mobile/src/interfaces/validator_interface.dart';
import 'package:chefpartner_mobile/src/models/generic_model.dart';
import 'package:chefpartner_mobile/src/utils/dialog_util.dart';

abstract class GenericService<M extends GenericModel,
    DAO extends GenericDAO<GenericDM, M>> {
  final DAO _dao;
  final ValidatorInterface<M>? _validator;

  GenericService({required DAO dao, ValidatorInterface<M>? validator})
      : _dao = dao,
        _validator = validator;

  Future<void> create(M model) async {
    try {
      _validator?.createUpdateValidation(model);
      await _dao.create(model);
    } on ValidationException catch (e) {
      DialogUtil.showAlertDialog(e.toString());
    }
  }

  Future<void> update(dynamic modelId, M model) async {
    try {
      _validator?.createUpdateValidation(model);
      await _dao.update(modelId, model);
    } on ValidationException catch (e) {
      DialogUtil.showAlertDialog(e.toString());
    }
  }

  Future<List<M>> listAll() async {
    return await _dao.listAll();
  }
}
