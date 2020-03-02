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
  
  NoteBloc(this._noteRepository);

  void mapEventToState(NoteEvent event) {
    if (event is GetNotes) {
      getNotes();
    } else if (event is CreateNote) {
      _noteRepository.createNote(event.note);
      getNotes();
    } else if (event is UpdateNote) {
      _noteRepository.updateNote(event.note);
      getNotes();
    } else if (event is DeleteNote) {
      _noteRepository.deleteNote(event.note);
      getNotes();
    }
  }

  void dispose() {
    _stateSubject.close();
    _eventSubject.close();
  }

  void getNotes() {
    _stateSubject.sink.add(_noteRepository.getNotes());
  }
}