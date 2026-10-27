import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  TextEditingController controller = TextEditingController();
  List<String> notes = [];
  int editIndex = -1; // -1 значит что мы ничего не редактируем

  void saveNote() {
    if (controller.text.isEmpty) return;

    setState(() {
      if (editIndex == -1) {
        notes.add(controller.text);
      } else {
        notes[editIndex] = controller.text;
        editIndex = -1;
      }
      controller.clear();
    });
  }

  void editNote(int index) {
    setState(() {
      editIndex = index;
      controller.text = notes[index];
    });
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
      editIndex = -1;
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Заметки')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Введите заметку',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: saveNote,
              child: Text('Сохранить'),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(notes[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => editNote(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteNote(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}