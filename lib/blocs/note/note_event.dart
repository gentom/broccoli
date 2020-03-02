import 'package:broccoli/models/note.dart';

abstract class NoteEvent {
  const NoteEvent();
}

class GetNotes extends NoteEvent {
  const GetNotes();
}

class CreateNote extends NoteEvent {
  final Note note;
  const CreateNote(this.note);
}

class UpdateNote extends NoteEvent {
  final Note note;
  const UpdateNote(this.note);
}

class DeleteNote extends NoteEvent {
  final Note note;
  const DeleteNote(this.note);
}