import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.iconfig.dart';

final di = GetIt.instance;

@injectableInit
void setupDi() => $initGetIt(di);
