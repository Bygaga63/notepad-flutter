import 'package:flutterappstackednotepad/models/note.dart';
import 'package:flutterappstackednotepad/repository/category_repository.dart';
import 'package:flutterappstackednotepad/repository/note_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
class NoteService {
  final CategoryRepository _categoryRepository;
  final NoteRepository _noteRepository;

  const NoteService({
    @required CategoryRepository categoryRepository,
    @required NoteRepository noteRepository,
  })  : _categoryRepository = categoryRepository,
        _noteRepository = noteRepository;

  Future<Note> create(Note category) async {
    final result = await _noteRepository.create(category);
    return result;
  }

  Future<List<Note>> loadByCategory(int categoryId) async {
    List<Note> notes = await _noteRepository.loadByCategory(categoryId);
    return notes;
  }
}
