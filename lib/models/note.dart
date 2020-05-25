import 'package:flutter/foundation.dart';

class Note {
  final int id;
  final int categoryId;
  final String title;
  final String text;

  const Note({
    this.id,
    @required this.categoryId,
    @required this.title,
    @required this.text,
  });

  Note copyWith({
    int id,
    int categoryId,
    String title,
    String text,
  }) {
    return Note(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      text: text ?? this.text,
    );
  }

  @override
  String toString() {
    return 'Note{id: $id, categoryId: $categoryId, title: $title, text: $text}';
  }
}
