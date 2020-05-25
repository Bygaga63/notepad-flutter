import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutterappstackednotepad/app/locator.dart';
import 'package:flutterappstackednotepad/app/routes.gr.dart';
import 'package:flutterappstackednotepad/models/note.dart';
import 'package:flutterappstackednotepad/services/note_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NotesViewModel extends BaseViewModel {
  final int categoryId;
  final _noteService = di<NoteService>();
  final _navigationService = di<NavigationService>();

  NotesViewModel({
    @required this.categoryId,
  });

  List<Note> _notes = [];

  List<Note> get notes => UnmodifiableListView(_notes);

  int get length => _notes.length;

  void loadNotes(int categoryId) async {
    final result = await runBusyFuture(_noteService.loadByCategory(categoryId));
    _notes = [...result];
  }

  void navigateToCreateEditNote([Note note]) {
    final newNote = Note(text: '', categoryId: categoryId, title: '');

    if (note == null) {
      note ??= newNote;
    }
    _navigationService
        .navigateTo(Routes.createEditNoteView,
            arguments: CreateEditNoteViewArguments(note: note))
        .then((value) => loadNotes(categoryId));
  }

  Future<void> deleteNote(int noteId) async {
    await runBusyFuture(_noteService.deleteNote(noteId));
    _notes = _notes.where((note) => note.id != noteId).toList();
  }
}
