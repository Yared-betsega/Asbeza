import 'package:asbeza/injection/auth_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt sl = GetIt.instance;

Future<void> init() async {
  // Features
  await authInjectionInit();

  // core
  sl.registerLazySingleton(() => http.Client());
}
