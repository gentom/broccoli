import 'package:broccoli/models/note.dart';

abstract class NoteProviderInterface {
  List<Note> getNotes();
  void createNote(Note note);
  void updateNote(Note note);
  void deleteNote(Note note);
}

class NoteProvider implements NoteProviderInterface {
  final List<Note> _notes = [];

  @override
  List<Note> getNotes() {
    return _notes;
  }

  @override
  void createNote(Note note) {
    _notes.add(note);
    return;
  }

  @override
  void updateNote(Note note) {
    final _idx = _notes.indexWhere((Note _note) => _note.id == note.id);
    _notes[_idx] = note;
    return;
  }

  @override
  void deleteNote(Note note) {
    _notes.removeWhere((Note _note) => _note.id == note.id);
    return;
  }
}