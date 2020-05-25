import 'package:flutterappstackednotepad/models/note.dart';
import 'package:flutterappstackednotepad/repository/note_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
class NoteService {
  final NoteRepository _noteRepository;

  const NoteService({
    @required NoteRepository noteRepository,
  }) : _noteRepository = noteRepository;

  Future<Note> save(Note category) async {
    final result = await _noteRepository.save(category);
    return result;
  }

  Future<List<Note>> loadByCategory(int categoryId) async {
    List<Note> notes = await _noteRepository.loadByCategory(categoryId);
    return notes;
  }

  Future<void> deleteNote(int noteId) async {
    _noteRepository.deleteNote(noteId);
  }
}
