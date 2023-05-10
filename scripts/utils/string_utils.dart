class StringUtils {
  static String snakeCaseToPascalCase(String str) {
    List<String> parts = str.split('_');
    String camelCase = "";

    for (int i = 0; i < parts.length; i++) {
      String word = parts[i];
      camelCase += word[0].toUpperCase() + word.substring(1);
    }

    return camelCase;
  }

  static String snakeCaseToCamelCase(String input) {
    List<String> words = input.split('_');
    String camelCase = '';

    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      if (word.isNotEmpty) {
        if (i > 0) {
          camelCase += word[0].toUpperCase() + word.substring(1);
        } else {
          camelCase += word;
        }
      }
    }

    return camelCase;
  }

}