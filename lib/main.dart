import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:broccoli/blocs/note/note_bloc.dart';
import 'package:broccoli/resources/providers/note_provider.dart';
import 'package:broccoli/repositories/note_repository.dart';
import 'package:broccoli/widgets/screens/home.dart';

void main() {
  final NoteProviderInterface _noteProvider = NoteProvider();
  final NoteRepositoryInterface _noteRepository = NoteRepository(_noteProvider);
  runApp(
    Provider<NoteBloc>(
      create: (context) => NoteBloc(_noteRepository),
      dispose: (context, bloc) => bloc.dispose(),
      child: BoilerplateApp(),
    )
  );
}

class BoilerplateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Boilerplate',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeScreen(),
    );
  }
}