import 'dart:io';

class FileUtils {

  static String _getFilePathInSrc(String folderInSrc, String fileName) {
    final scriptPath = Platform.script.toFilePath();
    final scriptDir = Directory(scriptPath).parent.parent;
    return '${scriptDir.path}/lib/src';
  }

  static File createFileInSrcFolder(String folderInSrc, String fileName) {
    final file = File(_getFilePathInSrc(folderInSrc, fileName));
    file.createSync();
    return file;
  }

  static File getFileContentInSrcFolder(String folderInSrc, String fileName) {
    return File(_getFilePathInSrc(folderInSrc, fileName));    
  }

}