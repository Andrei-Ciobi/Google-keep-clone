import 'package:flutter/material.dart';
import 'package:google_keep_clone/widgets/change_theme_button_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          foregroundColor: Theme.of(context).primaryColorDark,
          elevation: 0.0,
          title: Text(
            "Settings",
            style: TextStyle(color: Theme.of(context).primaryColor),
          )),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Dark Mode",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Transform.scale(
                  scale: 1.2,
                  child: const ChangeThemeButtonWidget(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
