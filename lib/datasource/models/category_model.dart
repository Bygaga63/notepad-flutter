import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappstackednotepad/datasource/hive_db.dart';
import 'package:flutterappstackednotepad/models/category.dart';
import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: HiveTypes.categoryId)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int iconCode;

  CategoryModel({this.title, this.iconCode});

  factory CategoryModel.fromDomain(Category category) => CategoryModel(
        title: category.title ?? '',
        iconCode: category?.icon?.codePoint ?? Icons.fiber_new.codePoint,
      );

  Category toDomain() => Category(
        id: key,
        title: title,
        icon: IconData(iconCode, fontFamily: 'MaterialIcons'),
      );

  @override
  String toString() {
    return 'CategoryModel{key: $key,title: $title, iconCode: $iconCode}';
  }
}
