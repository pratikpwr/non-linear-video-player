import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../ui/organisms/interactive_player/entities/interaction_entity.dart';
import '../../../domain/use_cases/get_football_manager_trailer_use_case.dart';

part 'football_manager_trailer_state.dart';

class FootballManagerTrailerCubit extends Cubit<FootballManagerTrailerState> {
  FootballManagerTrailerCubit(this.useCase)
      : super(FootballManagerTrailerInitial());

  final FootBallManagerTrailerUseCase useCase;

  Future<void> getFootballManagerTrailer() async {
    emit(FootballManagerTrailerLoading());
    final result = await useCase(NoParams());
    result.fold(
      (failure) => emit(
        FootballManagerTrailerError(failure.toString()),
      ),
      (data) => emit(
        FootballManagerTrailerLoaded(data),
      ),
    );
  }
}
