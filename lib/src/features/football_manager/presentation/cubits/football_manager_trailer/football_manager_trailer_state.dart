part of 'football_manager_trailer_cubit.dart';

abstract class FootballManagerTrailerState extends Equatable {
  const FootballManagerTrailerState();

  @override
  List<Object> get props => [];
}

class FootballManagerTrailerInitial extends FootballManagerTrailerState {}

class FootballManagerTrailerLoading extends FootballManagerTrailerState {}

class FootballManagerTrailerLoaded extends FootballManagerTrailerState {
  final InteractionEntity data;

  const FootballManagerTrailerLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class FootballManagerTrailerError extends FootballManagerTrailerState {
  final String message;

  const FootballManagerTrailerError(this.message);

  @override
  List<Object> get props => [message];
}
