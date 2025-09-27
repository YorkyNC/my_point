import 'dart:io';

import 'package:path/path.dart' as path;

void main(List<String> args) {
  final projectRoot = args.isNotEmpty ? args[0] : Directory.current.path;
  final libDir = Directory(path.join(projectRoot, 'lib'));

  if (!libDir.existsSync()) {
    print('Error: lib directory not found in $projectRoot');
    exit(1);
  }

  // Get package name from pubspec.yaml
  final pubspecFile = File(path.join(projectRoot, 'pubspec.yaml'));
  if (!pubspecFile.existsSync()) {
    print('Error: pubspec.yaml not found in $projectRoot');
    exit(1);
  }

  final packageName = _getPackageName(pubspecFile);
  if (packageName == null) {
    print('Error: Could not find package name in pubspec.yaml');
    exit(1);
  }

  print('Converting imports for package: $packageName');
  print('Processing files in: ${libDir.path}');

  int filesProcessed = 0;
  int importsConverted = 0;

  // Process all Dart files in lib directory
  libDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.dart'))
      .forEach((file) {
    final result = _processFile(file, packageName, libDir.path);
    if (result.modified) {
      filesProcessed++;
      importsConverted += result.conversions;
      print(
          '✓ ${path.relative(file.path, from: projectRoot)} - ${result.conversions} imports converted');
    }
  });

  print('\n🎉 Conversion complete!');
  print('Files processed: $filesProcessed');
  print('Total imports converted: $importsConverted');
}

String? _getPackageName(File pubspecFile) {
  final lines = pubspecFile.readAsLinesSync();
  for (final line in lines) {
    if (line.startsWith('name:')) {
      return line.split(':')[1].trim();
    }
  }
  return null;
}

class ProcessResult {
  final bool modified;
  final int conversions;

  ProcessResult(this.modified, this.conversions);
}

ProcessResult _processFile(File file, String packageName, String libPath) {
  final content = file.readAsStringSync();
  final lines = content.split('\n');
  final modifiedLines = <String>[];
  int conversions = 0;
  bool modified = false;

  for (final line in lines) {
    final trimmed = line.trim();

    // Check if it's a package import for this project
    if (trimmed.startsWith('import \'package:$packageName/') ||
        trimmed.startsWith('export \'package:$packageName/')) {
      final isExport = trimmed.startsWith('export');
      final keyword = isExport ? 'export' : 'import';

      // Extract the import path
      final match =
          RegExp('$keyword\\s+[\'"]package:$packageName/([^\'";]+)[\'"]')
              .firstMatch(trimmed);
      final importedPath = match?.group(1);

      if (importedPath != null) {
        final relativePath =
            _calculateRelativePath(file.path, importedPath, libPath);

        if (relativePath != null) {
          final newLine = line.replaceFirst(
              'package:$packageName/$importedPath', relativePath);
          modifiedLines.add(newLine);
          conversions++;
          modified = true;
          continue;
        }
      }
    }

    modifiedLines.add(line);
  }

  if (modified) {
    file.writeAsStringSync(modifiedLines.join('\n'));
  }

  return ProcessResult(modified, conversions);
}

String? _calculateRelativePath(String fromFile, String toPath, String libPath) {
  try {
    // Get the directory of the current file
    final fromDir = path.dirname(fromFile);

    // Full path to the imported file
    final toFile = path.join(libPath, toPath);

    // Calculate relative path
    final relativePath = path.relative(toFile, from: fromDir);

    // Ensure forward slashes for Dart imports
    return relativePath.replaceAll(r'\', '/');
  } catch (e) {
    print(
        'Warning: Could not calculate relative path for $toPath from $fromFile');
    return null;
  }
}
