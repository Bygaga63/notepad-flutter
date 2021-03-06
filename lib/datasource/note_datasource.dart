import 'package:flutterappstackednotepad/datasource/hive_db.dart';
import 'package:flutterappstackednotepad/datasource/models/note_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NoteDatasource {
  Future<List<NoteModel>> loadByCategory(int categoryId) async {
    final box = await _getBox();
    final result = box.values
        .where((noteModel) => noteModel.categoryId == categoryId)
        .toList();
    return result;
  }

  Future<NoteModel> create(NoteModel note) async {
    final box = await _getBox();
    final noteId = await box.add(note);
    return box.get(noteId);
  }

  Future<NoteModel> update(int id, NoteModel note) async {
    final box = await _getBox();
    await box.put(id, note);
    return box.get(id);
  }

  Future<Box<NoteModel>> _getBox() async =>
      Hive.openBox<NoteModel>(HiveTypes.noteBoxName);

  Future<void> delete(int noteId) async {
    final box = await _getBox();
    await box.delete(noteId);
  }
}
