// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutterappstackednotepad/ui/categories/categories_view.dart';
import 'package:flutterappstackednotepad/ui/notes/notes_view.dart';
import 'package:flutterappstackednotepad/ui/create_edit_note/create_edit_note_view.dart';
import 'package:flutterappstackednotepad/models/note.dart';

abstract class Routes {
  static const categories = '/';
  static const notes = '/notes';
  static const createEditNoteView = '/create-edit-note-view';
  static const all = {
    categories,
    notes,
    createEditNoteView,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.categories:
        return MaterialPageRoute<dynamic>(
          builder: (context) => CategoriesView(),
          settings: settings,
        );
      case Routes.notes:
        if (hasInvalidArgs<NotesViewArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<NotesViewArguments>(args);
        }
        final typedArgs = args as NotesViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => NotesView(categoryId: typedArgs.categoryId),
          settings: settings,
        );
      case Routes.createEditNoteView:
        if (hasInvalidArgs<CreateEditNoteViewArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<CreateEditNoteViewArguments>(args);
        }
        final typedArgs = args as CreateEditNoteViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateEditNoteView(note: typedArgs.note),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//NotesView arguments holder class
class NotesViewArguments {
  final int categoryId;
  NotesViewArguments({@required this.categoryId});
}

//CreateEditNoteView arguments holder class
class CreateEditNoteViewArguments {
  final Note note;
  CreateEditNoteViewArguments({@required this.note});
}
