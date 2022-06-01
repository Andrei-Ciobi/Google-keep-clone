import 'package:flutter/material.dart';
import 'package:google_keep_clone/Theme/colors.dart';
import 'package:google_keep_clone/pages/home_page.dart';
import 'package:google_keep_clone/services/note.dart';
import 'package:google_keep_clone/services/save_system.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({Key? key, required this.index}) : super(key: key);

  @override
  State<EditNotePage> createState() => _EditNotePageState();
  final int index;
}

class _EditNotePageState extends State<EditNotePage> {
  var saveSys = SaveSystem();
  late String newTitle;
  late String newContent;

  @override
  void initState() {
    Note note = saveSys.getNote(widget.index);
    newTitle = note.title;
    newContent = note.content;
    super.initState();
  }

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
            splashRadius: 15,
            onPressed: () {
              saveSys.editNote(Note(newTitle, newContent), widget.index);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: Icon(
              Icons.save_outlined,
              color: Theme.of(context).primaryColor,
            ))
      ],
    );
  }

  Widget getBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            child: TextFormField(
              onChanged: (value) {
                newTitle = value;
              },
              initialValue: newTitle,
              cursorColor: white,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey)),
            ),
          ),
          Container(
            height: 250,
            child: Form(
              child: TextFormField(
                  onChanged: (value) {
                    newContent = value;
                  },
                  initialValue: newContent,
                  cursorColor: white,
                  keyboardType: TextInputType.multiline,
                  minLines: 50,
                  maxLines: null,
                  style: const TextStyle(fontSize: 17),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Note",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey))),
            ),
          ),
        ],
      ),
    );
  }
}
