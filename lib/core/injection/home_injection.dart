import 'package:asbeza/asbeza.dart';

Future<void> homeInjection() async {
  // Bloc
  sl.registerFactory(() => SpendBloc(spendUsecase: sl()));
  sl.registerFactory(() => HomeBloc(loadHomeUsecase: sl()));

  // usecases
  sl.registerLazySingleton(() => SpendUsecase(homeRepository: sl()));
  sl.registerLazySingleton(() => LoadHomeUsecase(homeRepository: sl()));

  // repositories
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(dataSource: sl()));
  // datasources
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(client: sl()));
}
