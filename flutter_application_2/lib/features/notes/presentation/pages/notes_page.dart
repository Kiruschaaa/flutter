import 'package:flutter/material.dart';

import '../state/notes_model.dart';
import '../state/notes_widget_model.dart';
import '../widgets/note_item.dart';

// MWWM: Widget. Только рисует экран, всю логику берёт из WidgetModel
class NotesPage extends StatefulWidget {
  final NotesModel model;

  NotesPage({required this.model});

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late NotesWidgetModel wm;

  @override
  void initState() {
    super.initState();
    wm = NotesWidgetModel(widget.model);
  }

  @override
  void dispose() {
    wm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Заметки')),
      body: Padding(
        padding: EdgeInsets.all(16),
        // перерисовываем экран когда WidgetModel вызвал notifyListeners
        child: ListenableBuilder(
          listenable: wm,
          builder: (context, child) {
            return Column(
              children: [
                TextField(
                  controller: wm.controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Введите заметку',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: wm.onSavePressed,
                  child: Text('Сохранить'),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: wm.notes.length,
                    itemBuilder: (context, index) {
                      final note = wm.notes[index];
                      return NoteItem(
                        note: note,
                        onEdit: () => wm.onEditPressed(note),
                        onDelete: () => wm.onDeletePressed(note),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
