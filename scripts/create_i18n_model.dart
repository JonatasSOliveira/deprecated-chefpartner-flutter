import 'dart:io';

import 'utils/file_utils.dart';
import 'utils/string_utils.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart create_i18n_model.dart <model_name>');
    return;
  }

  final modelNameSnakeCase = arguments[0];
  final modelNamePascalCase = StringUtils.snakeCaseToPascalCase(modelNameSnakeCase);
  final modelNameCamelCase = StringUtils.snakeCaseToCamelCase(modelNameSnakeCase);
  createModelStringsInterface(modelNameSnakeCase, modelNamePascalCase);
  createPtBrModelStrings(modelNameSnakeCase, modelNamePascalCase);
  createEnUsModelStrings(modelNameSnakeCase, modelNamePascalCase);
  updateStringsInterface(modelNameSnakeCase, modelNamePascalCase, modelNameCamelCase);
  updatePtBrStringsFile(modelNameSnakeCase, modelNamePascalCase, modelNameCamelCase);
  updateEnUsStringsFile(modelNameSnakeCase, modelNamePascalCase, modelNameCamelCase);
}

void createModelStringsInterface(String modelNameSnakeCase, String modelNamePascalCase) {
  final file = FileUtils.createFileInSrcFolder('interfaces/i18n/strings', '${modelNameSnakeCase}_strings_interface');
  String content = '''
import 'package:chefpartner_mobile/src/interfaces/i18n/strings/generic_model_strings_interface.dart';

abstract class ${modelNamePascalCase}StringsInterface extends GenericModelStringsInterface {}
''';
  file.writeAsStringSync(content);
}

File createModelStringsFile(String localePath, String modelNameSnakeCase) {
  return FileUtils.createFileInSrcFolder('i18n/strings/$localePath', '${modelNameSnakeCase}_strings');
}

String getModelStringsContent(String localePascalCase, String modelNameSnakeCase, String modelNamePascalCase) {
  return '''import 'package:chefpartner_mobile/src/interfaces/i18n/strings/${modelNameSnakeCase}_strings_interface.dart';

class $localePascalCase${modelNamePascalCase}Strings implements ${modelNamePascalCase}StringsInterface {
  // TODO: define attributes
  @override
  String get pluralName => null;
  @override
  String get newRegister => null;
  @override
  String get formTitle => null;
  @override
  String get singularName => null;
}
''';
}

void createPtBrModelStrings(String modelNameSnakeCase, String modelNamePascalCase) {
  final file = createModelStringsFile('pt_BR', modelNameSnakeCase);
  file.writeAsStringSync(getModelStringsContent('PtBr', modelNameSnakeCase, modelNamePascalCase));
}

void createEnUsModelStrings(String modelNameSnakeCase, String modelNamePascalCase) {
  final file = createModelStringsFile('en_US', modelNameSnakeCase);
  file.writeAsStringSync(getModelStringsContent('EnUs', modelNameSnakeCase, modelNamePascalCase));
}

void updateStringsInterface(String modelNameSnakeCase, String modelNamePascalCase, String modelNameCamelCase) {
  const folderPathInSrc = 'interfaces/i18n/strings';
  final file = FileUtils.getFileContentInSrcFolder(folderPathInSrc, 'strings_interface');
  final content = file.readAsStringSync();
  List<String> splitedContend = content.split('abstract');
  String importsContent = splitedContend[0];
  String classContent = 'abstract${splitedContend[1]}';
  importsContent = importsContent.replaceFirst('\n', 
    "import 'package:chefpartner_mobile/src/$folderPathInSrc/${modelNameSnakeCase}_strings_interface.dart';\n"
  );
  RegExp regex = RegExp('}(?!.*})');
  classContent = classContent.replaceFirst(regex, "\t${modelNamePascalCase}StringsInterface get $modelNameCamelCase;\n}");
  file.writeAsStringSync(importsContent + classContent);
}

void updateLocaleStringsFile(String localePath, String localePascalCase, String modelNameSnakeCase, String modelNamePascalCase, String modelNameCamelCase) {
  final folderPathInSrc = 'i18n/strings/$localePath';
  final file = FileUtils.getFileContentInSrcFolder(folderPathInSrc, 'strings');
  final content = file.readAsStringSync();
  List<String> splitedContend = content.split('class');
  String importsContent = splitedContend[0];
  String classContent = 'class${splitedContend[1]}';
  importsContent = importsContent.replaceFirst('\n',
    "import 'package:chefpartner_mobile/src/interfaces/i18n/strings/${modelNameSnakeCase}_strings_interface.dart';\n"
    "import 'package:chefpartner_mobile/src/$folderPathInSrc/${modelNameSnakeCase}_strings.dart';\n"
  );
  RegExp regex = RegExp('}(?!.*})');
  classContent = classContent.replaceFirst(regex, "\t@override"
    "\n\t${modelNamePascalCase}StringsInterface get $modelNameCamelCase => $localePascalCase${modelNamePascalCase}Strings();"
    "\n}"
  );
  file.writeAsStringSync(importsContent + classContent);
}

void updatePtBrStringsFile(String modelNameSnakeCase, String modelNamePascalCase, String modelNameCamelCase) {
  updateLocaleStringsFile('pt_BR', 'PtBr', modelNameSnakeCase, modelNamePascalCase, modelNameCamelCase);
}

void updateEnUsStringsFile(String modelNameSnakeCase, String modelNamePascalCase, String modelNameCamelCase) {
  updateLocaleStringsFile('en_US', 'EnUs', modelNameSnakeCase, modelNamePascalCase, modelNameCamelCase);
}