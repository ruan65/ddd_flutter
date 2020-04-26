import 'package:ddd_flutter/injector.iconfig.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjector(String env) {
  $initGetIt(getIt, environment: env);
}
