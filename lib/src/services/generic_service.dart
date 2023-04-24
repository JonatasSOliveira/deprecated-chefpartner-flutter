import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/exceptions/validation_exception.dart';
import 'package:chefpartner_mobile/src/interfaces/default_validator_interface.dart';
import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';
import 'package:chefpartner_mobile/src/views/dialogs/generic_dialog.dart';

abstract class GenericService<M extends GenericDTO,
    Repository extends GenericRepository<GenericModel, M>> {
  final Repository _repository;
  final DefaultValidatorInterface<M>? _validator;

  GenericService(
      {required Repository repository, DefaultValidatorInterface<M>? validator})
      : _repository = repository,
        _validator = validator;

  Future<void> create(M model) async {
    try {
      _validator?.createUpdateValidation(model);
      await _repository.create(model);
    } on ValidationException catch (e) {
      GenericDialog.showAlertDialog(e.toString());
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(dynamic modelId, M model) async {
    try {
      _validator?.createUpdateValidation(model);
      await _repository.update(modelId, model);
    } on ValidationException catch (e) {
      GenericDialog.showAlertDialog(e.toString());
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<M>> listAll() async => await _repository.listAll();

  Future<void> softDelete(dynamic modelId) async =>
      await _repository.softDelete(modelId);
}
