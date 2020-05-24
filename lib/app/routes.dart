import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutterappstackednotepad/ui/categories/categories_view.dart';
import 'package:flutterappstackednotepad/ui/notes/notes_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  CategoriesView category;
  NotesView note;
}
