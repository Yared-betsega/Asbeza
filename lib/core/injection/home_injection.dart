import 'package:asbeza/features/home/data/datasources/home_remote_data_source.dart';
import 'package:asbeza/features/home/data/repositories/home_repository_impl.dart';
import 'package:asbeza/features/home/domain/repositories/home_repository.dart';
import 'package:asbeza/features/home/domain/usecases/load_home.dart';
import 'package:asbeza/features/home/domain/usecases/spend.dart';
import 'package:asbeza/features/home/presentation/bloc/home_bloc/home_bloc.dart';

import '../../features/home/presentation/bloc/spend_bloc/spend_bloc.dart';
import 'injection_container.dart';

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
