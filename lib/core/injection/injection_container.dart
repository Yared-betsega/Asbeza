import 'package:asbeza/core/injection/auth_injection.dart';
import 'package:asbeza/core/injection/home_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt sl = GetIt.instance;

Future<void> init() async {
  // Features
  await authInjectionInit();
  await homeInjection();

  // core
  sl.registerLazySingleton(() => http.Client());
}
