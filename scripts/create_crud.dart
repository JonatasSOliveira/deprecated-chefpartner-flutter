import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart script.dart <model_name>');
    return;
  }

  final modelNameSnakeCase = arguments[0];
  final modelNameCamelCase = snakeToPascalCase(modelNameSnakeCase);
  createModelFile(modelNameSnakeCase, modelNameCamelCase);
  createDTOFile(modelNameSnakeCase, modelNameCamelCase);
  createRepositoryFile(modelNameSnakeCase, modelNameCamelCase);
  createServiceFile(modelNameSnakeCase, modelNameCamelCase);
  createControllerFile(modelNameSnakeCase, modelNameCamelCase);
  print('Model $modelNameSnakeCase created.');
}

String snakeToPascalCase(String str) {
  List<String> parts = str.split('_');
  String camelCase = "";

  for (int i = 0; i < parts.length; i++) {
    String word = parts[i];
    camelCase += word[0].toUpperCase() + word.substring(1);
  }

  return camelCase;
}

File createFile(String folderInLib, String fileName) {
  final scriptPath = Platform.script.toFilePath();
  final scriptDir = Directory(scriptPath).parent.parent;
  final filePath = '${scriptDir.path}/lib/src/$folderInLib/$fileName.dart';
  final file = File(filePath);
  file.createSync();
  return file;
}

void createModelFile(String modelNameSnakeCase, String modelNameCamelCase) {
  final file = createFile('models', '${modelNameSnakeCase}_model');
  final String content =
      '''import 'package:chefpartner_mobile/src/models/generic_model/generic_model.dart';
import 'package:chefpartner_mobile/src/models/generic_model/attribute.dart';

class ${modelNameCamelCase}Model extends GenericModel {
  ${modelNameCamelCase}Model(): super(
    tableName: 'modelName',
    // TODO: define attributes
    attributes: null // [Attribute(name: 'name', type: AttributeType.text),]
  );
}
''';
  file.writeAsStringSync(content);
}

void createDTOFile(String modelNameSnakeCase, String modelNameCamelCase) {
  final file = createFile('dtos', '${modelNameSnakeCase}_dto');
  final String content =
      '''import 'package:chefpartner_mobile/src/dtos/generic_dto.dart';

class ${modelNameCamelCase}DTO extends GenericDTO {
  // TODO: define attributes

  ${modelNameCamelCase}DTO.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    // TODO: generate fromMap
    // Example: _name = map['name'];
    throw UnimplementedError();
  }
}
''';
  file.writeAsStringSync(content);
}

void createRepositoryFile(
    String modelNameSnakeCase, String modelNameCamelCase) {
  final file = createFile('repositories', '${modelNameSnakeCase}_repository');
  final String content =
      '''import 'package:chefpartner_mobile/src/repositories/generic_repository.dart';
import 'package:chefpartner_mobile/src/dtos/${modelNameSnakeCase}_dto.dart';
import 'package:chefpartner_mobile/src/models/${modelNameSnakeCase}_model.dart';

class ${modelNameCamelCase}Repository extends GenericRepository<${modelNameCamelCase}Model, ${modelNameCamelCase}DTO> {
  ${modelNameCamelCase}Repository()
      : super(
            databaseModel: ${modelNameCamelCase}Model(),
            // TODO: define attributes
            defaultInsertAttributes: null //Example: ['name']
        );

  @override
  List<Object?> getAttributesValues(${modelNameCamelCase}DTO model) =>
      // TODO: generate getAttributesValues
      // Example: [model.getName()];
      throw UnimplementedError();

  @override
  ${modelNameCamelCase}DTO fromMap(Map<String, dynamic> map) {
    return ${modelNameCamelCase}DTO.fromMap(map);
  }
}
''';
  file.writeAsStringSync(content);
}

void createServiceFile(String modelNameSnakeCase, String modelNameCamelCase) {
  final file = createFile('services', '${modelNameSnakeCase}_service');
  final String content =
      '''import 'package:chefpartner_mobile/src/repositories/${modelNameSnakeCase}_repository.dart';
import 'package:chefpartner_mobile/src/dtos/${modelNameSnakeCase}_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class ${modelNameCamelCase}Service extends GenericService<${modelNameCamelCase}DTO, ${modelNameCamelCase}Repository> {
  ${modelNameCamelCase}Service() : super(repository: ${modelNameCamelCase}Repository());
}
''';
  file.writeAsStringSync(content);
}

void createControllerFile(
    String modelNameSnakeCase, String modelNameCamelCase) {
  final file = createFile('controllers', '${modelNameSnakeCase}_controller');
  final String content =
      '''import 'package:chefpartner_mobile/src/repositories/${modelNameSnakeCase}_repository.dart';
import 'package:chefpartner_mobile/src/dtos/${modelNameSnakeCase}_dto.dart';
import 'package:chefpartner_mobile/src/services/generic_service.dart';

class ${modelNameCamelCase}Service extends GenericService<${modelNameCamelCase}DTO, ${modelNameCamelCase}Repository> {
  ${modelNameCamelCase}Service() : super(repository: ${modelNameCamelCase}Repository());
}
''';
  file.writeAsStringSync(content);
}
