import 'package:asbeza/asbeza.dart';

import 'package:http/http.dart' as http;

GetIt sl = GetIt.instance;

Future<void> init() async {
  // Features
  await authInjectionInit();
  await homeInjection();

  // core
  sl.registerLazySingleton(() => http.Client());
}
