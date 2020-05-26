import 'package:flutter/material.dart';
import 'package:flutterappstackednotepad/app/locator.dart';
import 'package:flutterappstackednotepad/models/note.dart';
import 'package:flutterappstackednotepad/services/note_service.dart';
import 'package:stacked/stacked.dart';

class CreateEditNoteViewModel extends BaseViewModel {
  Note _note;

  CreateEditNoteViewModel({
    @required Note note,
  }) : _note = note;

  final _noteService = di<NoteService>();

  bool get isEdit {
    return _note.id != null;
  }

  Note get note => _note;

  void saveNote(String title, String text) async {
    final createCandidate = note.copyWith(title: title, text: text);
    Note result = await runBusyFuture(_noteService.save(createCandidate));
    _note = note.copyWith(
      text: result.text,
      title: result.title,
      categoryId: result.categoryId,
      id: result.id,
    );
  }
}
