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
      final _note = Note('', 'foobar', '');
      _noteRepository.createNote(_note);
      final _notes = _noteRepository.getNotes();
      expect(_notes.length, 1);
    });

    test('Update Note', () {
      final _note = Note('', 'foobar', '');
      _noteRepository.createNote(_note);
      final _noteUpdated = Note('', 'hello', '');
      _noteRepository.updateNote(_noteUpdated);
      final _notes = _noteRepository.getNotes();
      expect(_notes[0].title, 'hello');
    });

    test('Delete Note', () {
      final _note = Note('', 'foobar', '');
      _noteRepository.createNote(_note);
      final _notes1 = _noteRepository.getNotes();
      expect(_notes1.length, 1);
      _noteRepository.deleteNote(_note);
      final _notes2 = _noteRepository.getNotes();
      expect(_notes2.length, 0);
    });
  });
}