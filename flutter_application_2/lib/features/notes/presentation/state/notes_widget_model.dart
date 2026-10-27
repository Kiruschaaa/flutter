import 'package:flutter/material.dart';

import '../../domain/entities/note.dart';
import 'notes_model.dart';

// MWWM: WidgetModel. Логика экрана и состояние (что показывать, что делать по нажатию)
class NotesWidgetModel extends ChangeNotifier {
  final NotesModel model;

  final TextEditingController controller = TextEditingController();
  List<Note> notes = [];

  // id заметки, которую редактируем. null значит что ничего не редактируем
  int? editingId;

  NotesWidgetModel(this.model) {
    notes = model.getNotes();
  }

  void onSavePressed() {
    final text = controller.text;
    if (text.isEmpty) return;

    if (editingId == null) {
      model.addNote(text);
    } else {
      model.updateNote(editingId!, text);
      editingId = null;
    }

    controller.clear();
    notes = model.getNotes();
    notifyListeners();
  }

  void onEditPressed(Note note) {
    editingId = note.id;
    controller.text = note.text;
    notifyListeners();
  }

  void onDeletePressed(Note note) {
    model.deleteNote(note.id);

    // если удалили заметку, которую редактировали, сбрасываем редактирование
    if (editingId == note.id) {
      editingId = null;
      controller.clear();
    }

    notes = model.getNotes();
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
