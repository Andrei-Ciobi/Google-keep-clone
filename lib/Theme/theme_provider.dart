import 'package:flutter/material.dart';
import 'package:google_keep_clone/Theme/colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: bgColor,
      backgroundColor: bgColor,
      primaryColor: white,
      cardColor: cardColor,
      shadowColor: black,
      primaryColorDark: Colors.grey,
      colorScheme: ColorScheme.dark(),
      iconTheme: IconThemeData(color: white));
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: white,
      backgroundColor: white,
      primaryColor: black,
      cardColor: gray,
      shadowColor: black,
      primaryColorDark: black,
      colorScheme: ColorScheme.light(),
      iconTheme: IconThemeData(color: cardColor));
}
