import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../ui/organisms/interactive_player/entities/interaction_entity.dart';
import '../repositories/football_manager_repository.dart';

class FootBallManagerTrailerUseCase
    implements UseCase<InteractiveEntity, NoParams> {
  final FootballManagerRepository repository;

  FootBallManagerTrailerUseCase(this.repository);

  @override
  Future<Either<Failure, InteractiveEntity>> call(NoParams params) async {
    return await repository.footballMangerTrailer();
  }
}
