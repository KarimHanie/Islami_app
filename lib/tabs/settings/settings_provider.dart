import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';
  bool get isDark=>themeMode==ThemeMode.dark;
  String get backGroundImageName=>isDark?'assets/images/dark_bg':'assets/images/default_bg';

  void changeLanguage(String selectedLanguage) {
    if(selectedLanguage==languageCode)return;
    languageCode = selectedLanguage;
    notifyListeners();

  }

  void changeTheme(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();// method from Change_notifier class that listen to change happens
    }
}
