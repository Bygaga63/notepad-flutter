import 'package:flutterappstackednotepad/datasource/models/category_model.dart';
import 'package:flutterappstackednotepad/datasource/models/note_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

class HiveTypes {
  static const int noteId = 0;
  static const String noteBoxName = 'note';
  static const int categoryId = 1;
  static const String categoryBoxName = 'category';
}

@singleton
class HiveDB {
  Future<void> init() async {
    await Hive.initFlutter();
    registerAdapters();
  }

  Future<void> registerAdapters() async {
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(NoteModelAdapter());
  }
}
