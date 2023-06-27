part of 'interaction_history_cubit.dart';

class InteractionHistoryState extends Equatable {
  final InteractionEntity currentInteraction;
  final List<InteractionEntity> history;

  const InteractionHistoryState({
    required this.currentInteraction,
    required this.history,
  });

  @override
  List<Object> get props => [history];
}
