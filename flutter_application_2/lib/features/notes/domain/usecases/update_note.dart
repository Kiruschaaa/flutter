import '../repositories/notes_repository.dart';

class UpdateNote {
  final NotesRepository repository;

  UpdateNote(this.repository);

  void call(int id, String text) {
    if (text.isEmpty) return;
    repository.updateNote(id, text);
  }
}
