import 'package:rxdart/rxdart.dart';
import 'package:broccoli/models/note.dart';
import 'package:broccoli/blocs/note/note_event.dart';
import 'package:broccoli/repositories/note_repository.dart';

class NoteBloc {
  final NoteRepositoryInterface _noteRepository;
  final BehaviorSubject<List<Note>> _stateSubject = BehaviorSubject();
  final PublishSubject<NoteEvent> _eventSubject = PublishSubject();
  Stream<List<Note>> get notesStream => _stateSubject.stream;
  Sink<NoteEvent> get noteEventSink => _eventSubject.sink;
  List<Note> get notes => _stateSubject.stream.value;

  NoteBloc(this._noteRepository) {
    _eventSubject.stream.listen(mapEventToState);
  }

  void mapEventToState(NoteEvent event) {
    if (event is GetNotes) {
      _getNotes();
    } else if (event is CreateNote) {
      _noteRepository.createNote(event.note);
      _getNotes();
    } else if (event is UpdateNote) {
      _noteRepository.updateNote(event.note);
      _getNotes();
    } else if (event is DeleteNote) {
      _noteRepository.deleteNote(event.note);
      _getNotes();
    }
  }

  void dispose() {
    _stateSubject.close();
    _eventSubject.close();
  }

  void _getNotes() {
    _stateSubject.sink.add(_noteRepository.getNotes());
  }
}