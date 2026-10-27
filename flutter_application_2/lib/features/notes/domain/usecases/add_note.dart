import '../repositories/notes_repository.dart';

class AddNote {
  final NotesRepository repository;

  AddNote(this.repository);

  void call(String text) {
    if (text.isEmpty) return;
    repository.addNote(text);
  }
}
