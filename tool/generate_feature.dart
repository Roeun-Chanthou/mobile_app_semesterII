import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('❌ Please provide a feature name.');
    print('Usage: dart tool/generate_feature.dart user');
    return;
  }

  final screens = arguments.first.toLowerCase();
  final className = _capitalize(screens);
  final folderPath = 'lib/screens/${screens}_screen';

  final files = {
    '$folderPath/${screens}_controller.dart': '''
import 'package:get/get.dart';

class ${className}Controller extends GetxController {
  // TODO: Implement $screens logic
}
''',
    '$folderPath/${screens}_view.dart': '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '${screens}_controller.dart';

class ${className}View extends GetView<${className}Controller> {
  const ${className}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$className Screen')),
      body: const Center(child: Text('Welcome to $className')),
    );
  }
}
''',
    '$folderPath/${screens}_binding.dart': '''
import 'package:get/get.dart';
import '${screens}_controller.dart';

class ${className}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${className}Controller>(() => ${className}Controller());
  }
}
''',
  };

  for (var entry in files.entries) {
    final file = File(entry.key);
    file.createSync(recursive: true);
    file.writeAsStringSync(entry.value);
    print('✅ Created: ${entry.key}');
  }

  print('🎉 Feature "$screens" generated successfully!');
}

String _capitalize(String str) =>
    str.isEmpty ? '' : str[0].toUpperCase() + str.substring(1);
