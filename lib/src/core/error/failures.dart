// coverage:ignore-file
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties = const <dynamic>[];

  const Failure([properties]);

  @override
  List<Object?> get props => properties;
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure([List props = const []]);

  @override
  List<Object?> get props => [];
}

class NoConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class DataBaseFailure extends Failure {}

class InvalidCredentialFailure extends Failure {}

class ParsingFailure extends Failure {}

class PagingNetworkConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NoDataFailure extends Failure {}

class InvalidFileTypeFailure extends Failure {}

class InvalidParamsFailure extends Failure {}

class LocationServiceDisabledFailure extends Failure {}

class LocationPermissionDeniedFailure extends Failure {}

class LocationNotFoundFailure extends Failure {}

class DuplicateUserFailure extends Failure {}

class PaymentFailure extends Failure {}
