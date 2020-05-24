// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutterappstackednotepad/datasource/category_datasource.dart';
import 'package:flutterappstackednotepad/repository/category_repository.dart';
import 'package:flutterappstackednotepad/services/category_service.dart';
import 'package:flutterappstackednotepad/services/thirdparty_services_module.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutterappstackednotepad/datasource/hive_db.dart';
import 'package:flutterappstackednotepad/datasource/note_datasource.dart';
import 'package:flutterappstackednotepad/repository/note_repository.dart';
import 'package:flutterappstackednotepad/services/note_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<CategoryDatasource>(() => CategoryDatasource());
  g.registerLazySingleton<CategoryRepository>(
      () => CategoryRepository(datasource: g<CategoryDatasource>()));
  g.registerLazySingleton<CategoryService>(
      () => CategoryService(categoryRepository: g<CategoryRepository>()));
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<NoteDatasource>(() => NoteDatasource());
  g.registerLazySingleton<NoteRepository>(
      () => NoteRepository(datasource: g<NoteDatasource>()));
  g.registerLazySingleton<NoteService>(() => NoteService(
      categoryRepository: g<CategoryRepository>(),
      noteRepository: g<NoteRepository>()));
  g.registerLazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);

  //Eager singletons must be registered in the right order
  g.registerSingleton<HiveDB>(HiveDB());
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
