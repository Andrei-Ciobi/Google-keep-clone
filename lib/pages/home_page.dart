import 'package:flutter/material.dart';
import 'package:google_keep_clone/Theme/colors.dart';
import 'package:google_keep_clone/pages/create_note_page.dart';
import 'package:google_keep_clone/pages/note_view_page.dart';
import 'package:google_keep_clone/pages/search_page.dart';
import 'package:google_keep_clone/pages/side_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_keep_clone/services/save_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  var saveSys = SaveSystem();
  var isGridView = true;

  @override
  Widget build(BuildContext context) {
    // saveSys.test();
    return Scaffold(
      key: _drawerKey,
      floatingActionButton: createNoteButton(context),
      endDrawerEnableOpenDragGesture: true,
      drawer: const SideMenu(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: getBody(),
    );
  }

  FloatingActionButton createNoteButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateNotePage()));
      },
      backgroundColor: Theme.of(context).cardColor,
      child: Icon(
        Icons.add,
        size: 50,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar(),
            allNotes(),
            isGridView ? notesGridView() : notesListView()
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchBarView()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: 3)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      _drawerKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).primaryColor,
                    )),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  height: 55,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Search notes",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            ),

            //Partea din dreapta la search bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => white.withOpacity(0.1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      onPressed: () {
                        setState(() {
                          isGridView = !isGridView;
                        });
                      },
                      child: Icon(
                        !isGridView
                            ? Icons.grid_view
                            : Icons.view_agenda_outlined,
                        color: Theme.of(context).primaryColor,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget allNotes() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(
        children: const [
          Text(
            "All notes",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget notesGridView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      height: MediaQuery.of(context).size.height,
      child: StaggeredGridView.countBuilder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: saveSys.getAllNotes().length,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 4,
          staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteViewPage(index: index)));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.6)),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        saveSys.getNote(index).title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        saveSys.getNote(index).content,
                      )
                    ],
                  ),
                ),
              )),
    );
  }

  Widget notesListView() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "LIST VIEW",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: saveSys.getAllNotes().length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteViewPage(index: index)));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(saveSys.getNote(index).title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        saveSys.getNote(index).content,
                      )
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
