import '../models/note_model.dart';

class NotesLocalDataSource {
  final List<NoteModel> _notes = [];
  int _nextId = 1;

  List<NoteModel> getNotes() {
    return List.of(_notes);
  }

  void addNote(String text) {
    _notes.add(NoteModel(id: _nextId, text: text));
    _nextId++;
  }

  void updateNote(int id, String text) {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      _notes[index] = NoteModel(id: id, text: text);
    }
  }

  void deleteNote(int id) {
    _notes.removeWhere((note) => note.id == id);
  }
}
