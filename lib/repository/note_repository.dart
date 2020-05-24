import 'package:flutter/foundation.dart';
import 'package:flutterappstackednotepad/datasource/models/note_model.dart';
import 'package:flutterappstackednotepad/datasource/note_datasource.dart';
import 'package:flutterappstackednotepad/models/note.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
class NoteRepository {
  final NoteDatasource _datasource;

  NoteRepository({@required NoteDatasource datasource})
      : _datasource = datasource;

  Future<List<Note>> loadByCategory(int categoryId) async {
    List<NoteModel> noteModels = await _datasource.loadByCategory(categoryId);
    final result = noteModels.map((noteModel) => noteModel.toDomain());
    return result;
  }

  Future<Note> create(Note note) async {
    final createdCandidate = NoteModel.fromDomain(note);
    final noteModel = await _datasource.create(createdCandidate);
    return noteModel.toDomain();
  }
}
