import '../repositories/notes_repository.dart';

class DeleteNote {
  final NotesRepository repository;

  DeleteNote(this.repository);

  void call(int id) {
    repository.deleteNote(id);
  }
}
