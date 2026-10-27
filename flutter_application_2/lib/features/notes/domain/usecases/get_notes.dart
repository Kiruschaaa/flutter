import '../entities/note.dart';
import '../repositories/notes_repository.dart';

class GetNotes {
  final NotesRepository repository;

  GetNotes(this.repository);

  List<Note> call() {
    return repository.getNotes();
  }
}
