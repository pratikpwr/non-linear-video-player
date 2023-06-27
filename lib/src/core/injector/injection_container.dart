import 'package:get_it/get_it.dart';

import '../preferences/local_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // sl.registerLazySingleton(() => CacheSelectedLanguagesUseCase(sl()));
  // sl.registerLazySingleton(() => LanguagesUseCase(sl()));
  // sl.registerLazySingleton(() => CacheCustomInterfaceUseCase(sl()));
  // sl.registerLazySingleton(() => CustomInterfaceUseCase(sl()));
  //
  // sl.registerLazySingleton<MyAccountRepository>(
  //   () => MyAccountRepositoryImpl(
  //     remoteDataSource: sl(),
  //     localDataSource: sl(),
  //   ),
  // );
  //
  // sl.registerLazySingleton<MyAccountRemoteDataSource>(
  //   () => MyAccountRemoteDataSourceImpl(),
  // );
  // sl.registerLazySingleton<MyAccountLocalDataSource>(
  //   () => MyAccountLocalDataSourceImpl(sl()),
  // );

  sl.registerLazySingleton(() => LocalPreferences());
}
