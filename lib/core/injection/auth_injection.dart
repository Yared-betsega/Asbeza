import 'package:asbeza/features/authentication/data/datasources/remote_data_source.dart';
import 'package:asbeza/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:asbeza/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:asbeza/features/authentication/domain/usecases/login.dart';
import 'package:asbeza/features/authentication/domain/usecases/signup.dart';
import 'package:asbeza/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:asbeza/features/authentication/presentation/bloc/signup/signup_bloc.dart';

import 'injection_container.dart';

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
