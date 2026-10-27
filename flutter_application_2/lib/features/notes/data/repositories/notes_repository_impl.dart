import '../../domain/entities/note.dart';
import '../../domain/repositories/notes_repository.dart';
import '../data_source/notes_local_data_source.dart';

class NotesRepositoryImpl implements NotesRepository {
  final NotesLocalDataSource dataSource;

  NotesRepositoryImpl(this.dataSource);

  @override
  List<Note> getNotes() {
    return dataSource.getNotes().map((model) => model.toEntity()).toList();
  }

  @override
  void addNote(String text) {
    dataSource.addNote(text);
  }

  @override
  void updateNote(int id, String text) {
    dataSource.updateNote(id, text);
  }

  @override
  void deleteNote(int id) {
    dataSource.deleteNote(id);
  }
}
