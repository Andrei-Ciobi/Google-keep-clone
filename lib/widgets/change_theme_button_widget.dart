import 'package:flutter/material.dart';
import 'package:google_keep_clone/Theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (switchValue) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(switchValue);
        });
  }
}