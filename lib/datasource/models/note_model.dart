import 'package:flutterappstackednotepad/datasource/hive_db.dart';
import 'package:flutterappstackednotepad/models/note.dart';
import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: HiveTypes.noteId)
class NoteModel extends HiveObject {
  @HiveField(0)
  final int categoryId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String text;

  NoteModel({this.categoryId, this.title, this.text});

  Note toDomain() => Note(
        id: key,
        categoryId: categoryId,
        title: title,
        text: text,
      );

  factory NoteModel.fromDomain(Note note) {
    return NoteModel(
      categoryId: note.categoryId,
      title: note.title ?? '',
      text: note.text ?? '',
    );
  }
}
