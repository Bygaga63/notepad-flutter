import 'package:flutter/material.dart';
import 'package:flutterappstackednotepad/app/locator.dart';
import 'package:flutterappstackednotepad/datasource/hive_db.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/routes.gr.dart';

void main() async {
  setupDi();
  await di<HiveDB>().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: di<NavigationService>().navigatorKey,
      initialRoute: Routes.categories,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
