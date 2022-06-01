import 'package:flutter/material.dart';
import 'package:google_keep_clone/pages/edit_note_page.dart';
import 'package:google_keep_clone/services/save_system.dart';

class NoteViewPage extends StatefulWidget {
  const NoteViewPage({Key? key, required this.index}) : super(key: key);

  @override
  State<NoteViewPage> createState() => _NoteViewPageState();
  final int index;
}

class _NoteViewPageState extends State<NoteViewPage> {
  var saveSys = SaveSystem();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).cardColor,
      foregroundColor: Theme.of(context).primaryColorDark,
      elevation: 0.0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.push_pin_outlined,
              color: Theme.of(context).primaryColor,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.archive_outlined,
              color: Theme.of(context).primaryColor,
            )),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditNotePage(index: widget.index)));
            },
            icon: Icon(
              Icons.edit_outlined,
              color: Theme.of(context).primaryColor,
            ))
      ],
    );
  }

  Widget getBody() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            saveSys.getNote(widget.index).title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            saveSys.getNote(widget.index).content,
          )
        ],
      ),
    );
  }
}
