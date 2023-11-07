import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeProvider() {
    _loadThemePreference();
  }

  toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _saveThemePreference();
    notifyListeners();
  }

  _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }

  _saveThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', _isDarkTheme);
  }
}

// enum ThemeType { light, dark }
//
// class ThemeProvider with ChangeNotifier {
//   ThemeData _themeData = ThemeData.light();
//   ThemeType _themeType = ThemeType.light;
//   final String _themeTypeKey = 'themeType';
//
// //Provides getter methods to access the current theme data and theme type.
//
//   ThemeData get themeData => _themeData;
//   ThemeType get themeType => _themeType;
//
//   ThemeProvider() {
//     loadTheme();
//   }
//
//   Future<void> toggleTheme() async {
//     _themeType = _themeType == ThemeType.light ? ThemeType.dark : ThemeType.light;
//     _themeData = _themeType == ThemeType.light ? ThemeData.light() : ThemeData.dark();
//     notifyListeners();
//     saveTheme();
//   }
//
// //saveTheme saves the current theme type to the device's shared preferences.
//
//   Future<void> saveTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_themeTypeKey, _themeType.toString());
//   }
//
// // retrieves the saved theme type from shared preferences.
//
//   Future<void> loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     final themeType = prefs.getString(_themeTypeKey);
//     if (themeType != null) {
//       _themeType = ThemeType.values.firstWhere(
//             (type) => type.toString() == themeType,
//         orElse: () => ThemeType.light,
//       );
//     }
//     _themeData = _themeType == ThemeType.light ? ThemeData.light() : ThemeData.dark();
//     notifyListeners();
//   }
// }
