import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  final _storage = FlutterSecureStorage();
  final _key = 'theme_mode';

  Future readTheme() async {
    String? value = await _storage.read(key: _key) ?? '0';
    _themeIndex = int.parse(value);
    switch (_themeIndex) {
      case 0:
        _mode = ThemeMode.system;
        break;
      case 1:
        _mode = ThemeMode.light;
        break;
      case 2:
        _mode = ThemeMode.dark;
        break;
    }
    notifyListeners();
  }

  int _themeIndex = 0;
  int get themeIndex => _themeIndex;

  void changeToSystem() {
    _themeIndex = 0;
    _mode = ThemeMode.system;
    _storage.write(key: _key, value: _themeIndex.toString());
    notifyListeners();
  }

  void changeToLight() {
    _themeIndex = 1;
    _mode = ThemeMode.light;
    _storage.write(key: _key, value: _themeIndex.toString());
    notifyListeners();
  }

  void changeToDark() {
    _themeIndex = 2;
    _mode = ThemeMode.dark;
    _storage.write(key: _key, value: _themeIndex.toString());
    notifyListeners();
  }
}
