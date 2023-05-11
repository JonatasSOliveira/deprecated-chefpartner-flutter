import 'utils/file_utils.dart';
import 'utils/string_utils.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart create_crud.dart <model_name>');
    return;
  }

  final modelNameSnakeCase = arguments[0];
  final modelNamePascalCase = StringUtils.snakeCaseToPascalCase(modelNameSnakeCase);
  createModelFile(modelNameSnakeCase, modelNamePascalCase);
  createDTOFile(modelNameSnakeCase, modelNamePascalCase);
  createRepositoryFile(modelNameSnakeCase, modelNamePascalCase);
  createServiceFile(modelNameSnakeCase, modelNamePascalCase);
  createControllerFile(modelNameSnakeCase, modelNamePascalCase);
  print('Model $modelNameSnakeCase created.');
}

void createModelFile(String modelNameSnakeCase, String modelNamePascalCase) {
  final file = FileUtils.createFileInSrcFolder('models', '${modelNameSnakeCase}_model');
  final String content =
      '''import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';

class ${modelNamePascalCase}Model extends GenericModel {
  ${modelNamePascalCase}Model(): super(
    tableName: 'modelName',
    // TODO: define attributes
    attributes: null // [Attribute(name: 'name', type: AttributeType.text),]
  );
}
''';
  file.writeAsStringSync(content);
}

void createDTOFile(String modelNameSnakeCase, String modelNamePascalCase) {
  final file = FileUtils.createFileInSrcFolder('dtos', '${modelNameSnakeCase}_dto');
  final String content =
      '''import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class ${modelNamePascalCase}DTO extends GenericDTO {
  // TODO: define attributes

  ${modelNamePascalCase}DTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    // TODO: generate fromMap
    // Example: _name = map['name'];
    throw UnimplementedError();
  }
}
''';
  file.writeAsStringSync(content);
}

void createRepositoryFile(
    String modelNameSnakeCase, String modelNamePascalCase) {
  final file = FileUtils.createFileInSrcFolder('repositories', '${modelNameSnakeCase}_repository');
  final String content =
      '''import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/dtos/${modelNameSnakeCase}_dto.dart';
import 'package:chefpartner_mobile/src/models/${modelNameSnakeCase}_model.dart';

class ${modelNamePascalCase}Repository extends GenericRepository<${modelNamePascalCase}Model, ${modelNamePascalCase}DTO> {
  ${modelNamePascalCase}Repository()
      : super(
            databaseModel: ${modelNamePascalCase}Model(),
            // TODO: define attributes
            defaultInsertAttributes: null //Example: ['name']
        );

  @override
  List<Object?> getAttributesValues(${modelNamePascalCase}DTO model) =>
      // TODO: generate getAttributesValues
      // Example: [model.getName()];
      throw UnimplementedError();

  @override
  ${modelNamePascalCase}DTO fromMap(Map<String, dynamic> map) {
    return ${modelNamePascalCase}DTO.fromMap(map);
  }
}
''';
  file.writeAsStringSync(content);
}

void createServiceFile(String modelNameSnakeCase, String modelNamePascalCase) {
  final file = FileUtils.createFileInSrcFolder('services', '${modelNameSnakeCase}_service');
  final String content =
      '''import 'package:chefpartner_mobile/src/repositories/${modelNameSnakeCase}_repository.dart';
import 'package:chefpartner_mobile/src/dtos/${modelNameSnakeCase}_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class ${modelNamePascalCase}Service extends GenericService<${modelNamePascalCase}DTO, ${modelNamePascalCase}Repository> {
  ${modelNamePascalCase}Service() : super(repository: ${modelNamePascalCase}Repository());
}
''';
  file.writeAsStringSync(content);
}

void createControllerFile(
    String modelNameSnakeCase, String modelNamePascalCase) {
  final file = FileUtils.createFileInSrcFolder('controllers', '${modelNameSnakeCase}_controller');
  final String content =
      '''import 'package:chefpartner_mobile/src/services/${modelNameSnakeCase}_service.dart';
import 'package:chefpartner_mobile/src/dtos/${modelNameSnakeCase}_dto.dart';
import 'package:chefpartner_mobile/src/controllers/generic_controller.dart';

class ${modelNamePascalCase}Controller extends GenericController<${modelNamePascalCase}DTO, ${modelNamePascalCase}Service> {
  ${modelNamePascalCase}Controller() : super(service: ${modelNamePascalCase}Service());
}
''';
  file.writeAsStringSync(content);
}
