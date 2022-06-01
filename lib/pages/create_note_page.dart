import 'package:flutter/material.dart';
import 'package:google_keep_clone/Theme/colors.dart';
import 'package:google_keep_clone/pages/home_page.dart';
import 'package:google_keep_clone/services/note.dart';
import 'package:google_keep_clone/services/save_system.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var saveSys = SaveSystem();
  var newTitle = "";
  var newContent = "";
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
              saveSys.addNote(Note(newTitle, newContent));
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
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
          TextField(
            onChanged: (value) {
              newTitle = value;
            },
            cursorColor: Theme.of(context).primaryColor,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Title",
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          SizedBox(
            height: 250,
            child: TextField(
                onChanged: (value) {
                  newContent = value;
                },
                cursorColor: white,
                keyboardType: TextInputType.multiline,
                minLines: 50,
                maxLines: null,
                style: TextStyle(
                    fontSize: 17, color: Theme.of(context).primaryColor),
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
        ],
      ),
    );
  }
}
