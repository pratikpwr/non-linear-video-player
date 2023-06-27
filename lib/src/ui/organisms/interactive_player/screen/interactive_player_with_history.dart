import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../atoms/padding.dart';
import '../cubit/interaction_history_cubit.dart';
import '../entities/interaction_entity.dart';
import 'interactive_player.dart';

class InteractionPlayerWithHistory extends StatelessWidget {
  const InteractionPlayerWithHistory({
    super.key,
    required this.initialInteraction,
  });

  final InteractionEntity initialInteraction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InteractionHistoryCubit(initialInteraction),
      child: BlocBuilder<InteractionHistoryCubit, InteractionHistoryState>(
        builder: (context, state) {
          return Column(
            children: [
              InteractivePlayer(
                initialInteraction: state.currentInteraction,
                onInteraction: (interaction) {
                  context
                      .read<InteractionHistoryCubit>()
                      .addInteraction(interaction);
                },
              ),
              padding16,
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'History',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ...state.history.map(
                (interaction) => ListTile(
                  title: Text(interaction.title),
                  subtitle: Text(interaction.question ?? ''),
                  trailing: TextButton(
                    child: Text(
                      state.currentInteraction == interaction
                          ? 'Playing'
                          : 'Watch',
                      style: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      if (state.currentInteraction == interaction) return;
                      context
                          .read<InteractionHistoryCubit>()
                          .selectInteraction(interaction);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
