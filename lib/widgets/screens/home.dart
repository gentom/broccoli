import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:broccoli/blocs/note/note_bloc.dart';
import 'package:broccoli/blocs/note/note_event.dart';
import 'package:broccoli/models/note.dart';
import 'package:broccoli/widgets/screens/note/create.dart';

class HomeScreen extends StatelessWidget {
  final List<Note> _initialDatas = [];

  @override
  Widget build(BuildContext context) {
    final _noteBloc = Provider.of<NoteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30.0,
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return CreateNoteScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: StreamBuilder<List<Note>>(
          stream: _noteBloc.notesStream,
          initialData: _initialDatas,
          builder: (context, snapshot) {
            if(snapshot.data.isEmpty) {
              return _noItems(context);
            }
            return ListView.builder(
              itemBuilder: (context, n) {
                return _buildItem(context, snapshot.data.elementAt(n), n);
              },
              itemCount: snapshot.data.length,
            );
          },
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, Note note, int n) {
    final _noteBloc = Provider.of<NoteBloc>(context);
    return Padding(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.details),
                tooltip: 'detail',
                onPressed: () {
                  // detail page
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  _noteBloc.noteEventSink.add(DeleteNote(note));
                },
              )
            ].toList().where((elm) => elm != null).toList(),
          )
        ],
      ),
    );
  }

  Widget _noItems(BuildContext context) {
    return Center(
      child: Text('No Note.'),
    );
  }
}