import 'package:google_keep_clone/services/note.dart';

class SaveSystem {
  static final SaveSystem _singleton = SaveSystem._internal();
  final List<Note> _allNotes = <Note>[];

  factory SaveSystem() {
    return _singleton;
  }

  SaveSystem._internal();

  void test() {
    addNote(Note("Test1", "This is a test for the first node"));
    addNote(Note("Test2", "This is a test for the second node"));
  }

  void addNote(Note note) {
    _allNotes.add(note);
  }

  void editNote(Note note, int index) {
    _allNotes[index] = note;
  }

  Note getNote(int index) {
    return _allNotes.elementAt(index);
  }

  List<Note> getAllNotes() {
    return _allNotes;
  }
}
