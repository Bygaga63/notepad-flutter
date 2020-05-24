import 'package:flutterappstackednotepad/models/category.dart';
import 'package:flutterappstackednotepad/repository/category_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
class CategoryService {
  final CategoryRepository _categoryRepository;

  const CategoryService({
    @required CategoryRepository categoryRepository,
  }) : _categoryRepository = categoryRepository;

  Future<List<Category>> loadAll() async {
    final categories = await _categoryRepository.loadAll();
    return categories;
  }

  Future<Category> create(Category category) async {
    final result = await _categoryRepository.create(category);
    return result;
  }
}
