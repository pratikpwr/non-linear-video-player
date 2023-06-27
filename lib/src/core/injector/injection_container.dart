import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/football_manager/data/data_sources/football_manager_remote_data_source.dart';
import '../../features/football_manager/data/repositories/football_manager_repository_impl.dart';
import '../../features/football_manager/domain/repositories/football_manager_repository.dart';
import '../../features/football_manager/domain/use_cases/get_football_manager_trailer_use_case.dart';
import '../network/network_info.dart';
import '../preferences/local_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => FootBallManagerTrailerUseCase(sl()));

  sl.registerLazySingleton<FootballManagerRepository>(
    () => FootballManagerRepositoryImpl(dataSource: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<FootballManagerRemoteDataSource>(
    () => FootballManagerRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => LocalPreferences());
}
