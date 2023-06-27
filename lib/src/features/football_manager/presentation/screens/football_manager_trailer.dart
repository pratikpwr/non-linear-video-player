import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injector/injection_container.dart';
import '../../../../ui/organisms/interactive_player/screen/interactive_player_with_history.dart';
import '../cubits/football_manager_trailer/football_manager_trailer_cubit.dart';

class FootBallManagerTrailer extends StatelessWidget {
  const FootBallManagerTrailer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FootballManagerTrailerCubit(sl())..getFootballManagerTrailer(),
      child: Scaffold(
        body: BlocBuilder<FootballManagerTrailerCubit,
            FootballManagerTrailerState>(
          builder: (context, state) {
            if (state is FootballManagerTrailerLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FootballManagerTrailerError) {
              return Center(child: Text(state.message));
            } else if (state is FootballManagerTrailerLoaded) {
              return InteractionPlayerWithHistory(initialInteraction: state.data);
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
