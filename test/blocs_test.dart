import 'package:flutter_test/flutter_test.dart';
import 'package:broccoli/models/note.dart';
import 'package:broccoli/resources/providers/note_provider.dart';
import 'package:broccoli/repositories/note_repository.dart';
import 'package:broccoli/blocs/note/note_bloc.dart';
import 'package:broccoli/blocs/note/note_event.dart';

void main() {
  group('Note Bloc layer', () {
    NoteProviderInterface _noteProvider;
    NoteRepositoryInterface _noteRepository;
    NoteBloc _noteBloc;

    setUp(() {
      _noteProvider = NoteProvider();
      _noteRepository = NoteRepository(_noteProvider);
      _noteBloc = NoteBloc(_noteRepository);
    });

    test('Test All Events', () {
      List<Note> _notes;
      Note _note;
      _noteBloc.mapEventToState(GetNotes());
      _notes = _noteBloc.notes;
      expect(_notes.length, 0);
      _note = Note(null, 'foobar', '');
      _noteBloc.mapEventToState(CreateNote(_note));
      expect(_notes.length, 1);
      _note = Note(_notes[0].id, 'hello', '');
      _noteBloc.mapEventToState(UpdateNote(_note));
      expect(_notes[0].title, 'hello');
      _noteBloc.mapEventToState(DeleteNote(_note));
      expect(_notes.length, 0);
    });
  });
}