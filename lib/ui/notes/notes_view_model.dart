import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutterappstackednotepad/app/locator.dart';
import 'package:flutterappstackednotepad/models/note.dart';
import 'package:flutterappstackednotepad/services/note_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NotesViewModel extends BaseViewModel {
  final int categoryId;

  NotesViewModel({
    @required this.categoryId,
  });

  final _noteService = di<NoteService>();
  final _snackService = di<SnackbarService>();
  List<Note> _notes = [];

  List<Note> get notes => UnmodifiableListView(_notes);

  int get length => _notes.length;

  void loadNotes(int categoryId) async {
    final result = await runBusyFuture(_noteService.loadByCategory(categoryId));
    _notes = [...result];
  }

  void createNote(Note note) async {
    final result = await runBusyFuture(_noteService.create(note));
    _notes = [..._notes, result];
    _snackService.showSnackbar(
        title: 'Note successfully created!', iconData: Icons.done);
  }
}
