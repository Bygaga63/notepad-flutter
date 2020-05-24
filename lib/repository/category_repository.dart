import 'package:flutterappstackednotepad/datasource/category_datasource.dart';
import 'package:flutterappstackednotepad/datasource/models/category_model.dart';
import 'package:flutterappstackednotepad/models/category.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoryRepository {
  final CategoryDatasource _datasource;

  CategoryRepository({CategoryDatasource datasource})
      : this._datasource = datasource;

  Future<List<Category>> loadAll() async {
    List<CategoryModel> categoryModels = await _datasource.getAll();
    final categories = categoryModels
        .map((categoryModel) => categoryModel.toDomain())
        .toList();
    return categories;
  }

  Future<Category> create(Category category) async {
    final createCandidate = CategoryModel.fromDomain(category);
    final result = await _datasource.save(createCandidate);
    return result.toDomain();
  }
}
