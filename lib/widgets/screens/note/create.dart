import 'package:broccoli/models/note.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:broccoli/blocs/note/note_bloc.dart';
import 'package:broccoli/blocs/note/note_event.dart';
import 'package:broccoli/widgets/components/atoms/buttons.dart';
import 'package:broccoli/widgets/components/molecules/inputs.dart';

class CreateNoteScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Note'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              MolOneLineTextField(
                Icons.edit,
                'Title',
                'Write Title...',
                _titleController,
                validate: false,
              ),
              SizedBox(height: 4),
              MolMultiLineTextField(
                Icons.edit,
                'Content',
                'Write Content...',
                _contentController,
                validate: false,
              ),
              SizedBox(height: 4),
              AtmFlatButton('Create', _createNote)
            ],
          ),
        ),
      ),
    );
  }

  void _createNote(BuildContext context) {
    final _noteBloc = Provider.of<NoteBloc>(context, listen: false);
    final _note = Note(
      null,
      _titleController.text,
      _contentController.text
    );
    _noteBloc.noteEventSink.add(CreateNote(_note));
    Navigator.pop(context);
  }
}