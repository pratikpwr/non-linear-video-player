import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../ui/organisms/interactive_player/entities/interaction_entity.dart';

abstract class FootballManagerRepository {
  Future<Either<Failure, InteractionEntity>> footballMangerTrailer();
}

