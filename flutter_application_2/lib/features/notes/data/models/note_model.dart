import '../../domain/entities/note.dart';

class NoteModel {
  final int id;
  final String text;

  NoteModel({required this.id, required this.text});

  Note toEntity() {
    return Note(id: id, text: text);
  }
}
