import 'package:flutter_test/flutter_test.dart';
import 'package:broccoli/models/note.dart';
import 'package:broccoli/resources/providers/note_provider.dart';
import 'package:broccoli/repositories/note_repository.dart';

void main() {
  group('Note resource layer', () {
    NoteProviderInterface _noteProvider;
    NoteRepositoryInterface _noteRepository;

    setUp(() {
      _noteProvider = NoteProvider();
      _noteRepository = NoteRepository(_noteProvider);
    });
    
    test('Get Notes', () {
      final _notes = _noteRepository.getNotes();
      expect(_notes.length, 0);
    });

    test('Create Note', () {
      List<Note> _notes;
      final _note = Note(null, 'foobar', '');
      _noteRepository.createNote(_note);
      _notes = _noteRepository.getNotes();
      expect(_notes.length, 1);
    });

    test('Update Note', () {
      List<Note> _notes;
      final _note = Note(null, 'foobar', '');
      _noteRepository.createNote(_note);
      _notes = _noteRepository.getNotes();
      print(_notes[0].id);
      print(_notes[0].title);
      final _noteUpdated = Note(_notes[0].id, 'hello', '');
      _noteRepository.updateNote(_noteUpdated);
      _notes = _noteRepository.getNotes();
      expect(_notes[0].title, 'hello');
      print(_notes[0].id);
      print(_notes[0].title);
    });

    test('Delete Note', () {
      List<Note> _notes;
      final _note = Note(null, 'foobar', '');
      _noteRepository.createNote(_note);
      _notes = _noteRepository.getNotes();
      expect(_notes.length, 1);
      _noteRepository.deleteNote(_note);
      _notes = _noteRepository.getNotes();
      expect(_notes.length, 0);
    });
  });
}