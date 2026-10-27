import '../../domain/entities/note.dart';
import '../../domain/usecases/add_note.dart';
import '../../domain/usecases/delete_note.dart';
import '../../domain/usecases/get_notes.dart';
import '../../domain/usecases/update_note.dart';

// MWWM: Model. Связывает WidgetModel с бизнес-логикой (вызывает usecases)
class NotesModel {
  final GetNotes _getNotes;
  final AddNote _addNote;
  final UpdateNote _updateNote;
  final DeleteNote _deleteNote;

  NotesModel({
    required GetNotes getNotes,
    required AddNote addNote,
    required UpdateNote updateNote,
    required DeleteNote deleteNote,
  })  : _getNotes = getNotes,
        _addNote = addNote,
        _updateNote = updateNote,
        _deleteNote = deleteNote;

  List<Note> getNotes() => _getNotes();

  void addNote(String text) => _addNote(text);

  void updateNote(int id, String text) => _updateNote(id, text);

  void deleteNote(int id) => _deleteNote(id);
}
