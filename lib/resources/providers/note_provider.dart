import 'package:broccoli/models/note.dart';

abstract class NoteProviderInterface {
  List<Note> getNotes();
  void createNote(Note note);
  void updateNote(Note note);
  void deleteNote(Note note);
}