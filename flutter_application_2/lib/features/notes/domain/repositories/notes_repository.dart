import '../entities/note.dart';

abstract class NotesRepository {
  List<Note> getNotes();
  void addNote(String text);
  void updateNote(int id, String text);
  void deleteNote(int id);
}
