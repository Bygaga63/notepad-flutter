import 'package:flutterappstackednotepad/app/locator.dart';
import 'package:flutterappstackednotepad/app/routes.gr.dart';
import 'package:flutterappstackednotepad/models/category.dart';
import 'package:flutterappstackednotepad/services/category_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class CategoriesViewModel extends BaseViewModel {
  final _categoryService = di<CategoryService>();
  final _navigationService = di<NavigationService>();
  List<Category> _data = [];

  List<Category> get data => _data;

  int get length => _data.length;

  void loadCategories() async {
    final result = await runBusyFuture(_categoryService.loadAll());
    _data = [...result];
  }

  void createCategory(String title) async {
    closeCreateDialog();
    Category createCandidate = Category(title: title);
    final result =
        await runBusyFuture(_categoryService.create(createCandidate));
    _data = [..._data, result];
  }

  void navigateToNote(int id) {
    _navigationService.navigateTo(Routes.note,
        arguments: NotesViewArguments(categoryId: id));
  }

  void closeCreateDialog() => _navigationService.back();
}
