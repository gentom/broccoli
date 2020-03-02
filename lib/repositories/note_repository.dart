import 'package:broccoli/models/note.dart';

abstract class NoteRepositoryInterface {
  List<Note> getNotes();
  void createNote(Note note);
  void updateNote(Note note);
  void deleteNote(Note note);
}