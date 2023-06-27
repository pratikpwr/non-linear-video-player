import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entities/interaction_entity.dart';

part 'interaction_history_state.dart';

class InteractionHistoryCubit extends Cubit<InteractionHistoryState> {
  InteractionHistoryCubit(this.initialInteraction)
      : super(
          InteractionHistoryState(
            currentInteraction: initialInteraction,
            history: [initialInteraction],
          ),
        );

  final InteractionEntity initialInteraction;

  void addInteraction(InteractionEntity interaction) {
    final interactions = [...state.history, interaction];
    emit(
      InteractionHistoryState(
        currentInteraction: interaction,
        history: interactions,
      ),
    );
  }

  void selectInteraction(InteractionEntity interaction) {
    final interactions = [...state.history];
    int index = interactions.indexOf(interaction);

    interactions.removeRange(index + 1, interactions.length);

    emit(
      InteractionHistoryState(
        currentInteraction: interaction,
        history: interactions,
      ),
    );
  }
}
