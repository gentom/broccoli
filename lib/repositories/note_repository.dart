import 'package:broccoli/models/note.dart';
import 'package:broccoli/resources/providers/note_provider.dart';

abstract class NoteRepositoryInterface {
  List<Note> getNotes();
  void createNote(Note note);
  void updateNote(Note note);
  void deleteNote(Note note);
}

class NoteRepository implements NoteRepositoryInterface {
  final NoteProviderInterface _noteProvider;

  NoteRepository(this._noteProvider);

  @override
  List<Note> getNotes() {
    return _noteProvider.getNotes();
  }

  @override
  void createNote(Note note) {
    return _noteProvider.createNote(note);
  }

  @override
  void updateNote(Note note) {
    return _noteProvider.updateNote(note);
  }

  @override
  void deleteNote(Note note) {
    return _noteProvider.deleteNote(note);
  }
}