import 'package:asbeza/asbeza.dart';

Future<void> authInjectionInit() async {
  // Bloc
  sl.registerFactory(() => LoginBloc(usecase: sl()));
  sl.registerFactory(() => SignupBloc(usecase: sl()));

  // usecases
  sl.registerLazySingleton(() => LoginUsecase(authenticationRepository: sl()));
  sl.registerLazySingleton(() => SignUpUseCase(authenticationRepository: sl()));

  // repositories
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(dataSource: sl()));

  // datasources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(client: sl()));
}
