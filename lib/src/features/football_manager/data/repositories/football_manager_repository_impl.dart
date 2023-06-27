import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../ui/organisms/interactive_player/entities/interaction_entity.dart';
import '../../domain/repositories/football_manager_repository.dart';
import '../data_sources/football_manager_remote_data_source.dart';

class FootballManagerRepositoryImpl implements FootballManagerRepository {
  final FootballManagerRemoteDataSource dataSource;
  final NetworkInfo networkInfo;

  const FootballManagerRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, InteractionEntity>> footballMangerTrailer() async =>
      _result(
        () => dataSource.footballManagerTrailer(),
      );

  Future<Either<Failure, T>> _result<T>(Future<T> Function() callback) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await callback());
      } on NoDataException {
        return Left(NoDataFailure());
      } on ServerException {
        return Left(ServerFailure());
      } on ParsingException {
        return Left(ParsingFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
