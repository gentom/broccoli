import 'package:uuid/uuid.dart';

class Note {
  String id;
  String title;
  String content;

  Note(String id, this.title, String content) {
    this.id = id ?? Uuid().v4();
    this.content = content ?? '';
  }
}