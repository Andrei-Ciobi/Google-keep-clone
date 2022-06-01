import 'package:flutter/material.dart';
import 'package:google_keep_clone/Theme/colors.dart';
import 'package:google_keep_clone/pages/settings_page.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: const Text(
                  "Google Keep",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Divider(
                color: white.withOpacity(0.4),
              ),

              // Notes btn
              notesButton(),
              archiveButton(),
              settingsButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget notesButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.only(right: 15),
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Colors.orangeAccent.withOpacity(0.3)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ))),
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.lightbulb_outline,
                  size: 21, color: Theme.of(context).primaryColor),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Notes",
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.8),
                    fontSize: 17),
              )
            ],
          )),
    );
  }

  Widget archiveButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.only(right: 15),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50)),
          ))),
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.archive_outlined,
                  size: 21, color: Theme.of(context).primaryColor),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Archive",
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.8),
                    fontSize: 17),
              )
            ],
          )),
    );
  }

  Widget settingsButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.only(right: 15),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50)),
          ))),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          },
          child: Row(
            children: [
              Icon(Icons.settings_outlined,
                  size: 21, color: Theme.of(context).primaryColor),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Settings",
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.8),
                    fontSize: 17),
              )
            ],
          )),
    );
  }
}
