import 'package:flutterappstackednotepad/datasource/hive_db.dart';
import 'package:flutterappstackednotepad/datasource/models/category_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoryDatasource {
  Future<List<CategoryModel>> getAll() async {
    final box = await _getBox();
    return box.values.toList();
  }

  Future<CategoryModel> save(CategoryModel category) async {
    final box = await _getBox();
    final categoryId = await box.add(category);
    return box.get(categoryId);
  }

  Future<Box<CategoryModel>> _getBox() async =>
      Hive.openBox<CategoryModel>(HiveTypes.categoryBoxName);
}
