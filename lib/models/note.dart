import 'package:flutter/foundation.dart';

class Note {
  final int id;
  final int categoryId;
  final String title;
  final String text;

  const Note({
    @required this.id,
    @required this.categoryId,
    @required this.title,
    @required this.text,
  });

  Note copyWith({
    String id,
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
}
