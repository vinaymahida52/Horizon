import 'dart:io';

void main() {
  createProjectStructure();
}

void createProjectStructure() {
  // Base directory path
  final baseDir = Directory.current;

  // Core directory
  final coreDir = Directory('${baseDir.path}/core');
  coreDir.createSync(recursive: true);

  // Const directory
  final constDir = Directory('${baseDir.path}/const');
  constDir.createSync(recursive: true);

  // Features directory and its subdirectories
  final featuresDir = Directory('${baseDir.path}/features');
  featuresDir.createSync(recursive: true);

  // Create subdirectories inside features
  final authDir = Directory('${featuresDir.path}/auth');
  final homeDir = Directory('${featuresDir.path}/home');
  final employeeDir = Directory('${featuresDir.path}/employee');
  final managerDir = Directory('${featuresDir.path}/manager');

  authDir.createSync(recursive: true);
  homeDir.createSync(recursive: true);
  employeeDir.createSync(recursive: true);
  managerDir.createSync(recursive: true);
}
