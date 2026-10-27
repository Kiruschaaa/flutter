import 'package:flutter/material.dart';

import 'features/notes/data/data_source/notes_local_data_source.dart';
import 'features/notes/data/repositories/notes_repository_impl.dart';
import 'features/notes/domain/usecases/add_note.dart';
import 'features/notes/domain/usecases/delete_note.dart';
import 'features/notes/domain/usecases/get_notes.dart';
import 'features/notes/domain/usecases/update_note.dart';
import 'features/notes/presentation/pages/notes_page.dart';
import 'features/notes/presentation/state/notes_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataSource = NotesLocalDataSource();
    final repository = NotesRepositoryImpl(dataSource);

    final model = NotesModel(
      getNotes: GetNotes(repository),
      addNote: AddNote(repository),
      updateNote: UpdateNote(repository),
      deleteNote: DeleteNote(repository),
    );

    return MaterialApp(
      home: NotesPage(model: model),
    );
  }
}
