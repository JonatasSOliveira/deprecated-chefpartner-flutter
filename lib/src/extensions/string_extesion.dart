extension StringExtension on String {
  int toInt() {
    return int.parse(replaceAll('.', '').replaceAll(',', ''));
  }
}
