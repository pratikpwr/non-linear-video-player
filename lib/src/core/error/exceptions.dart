// coverage:ignore-file

class ServerException implements Exception {
  final String error;

  ServerException(this.error);
}

class CacheException implements Exception {}

class LocalStorageException implements Exception {
  final String? error;

  LocalStorageException([this.error]);
}

class DataBaseException implements Exception {}

class FetchDataException implements Exception {
  final String error;

  FetchDataException(this.error);
}

class InvalidCredentialsException implements Exception {}

class ParsingException implements Exception {}

class NoDataException implements Exception {}

class InvalidFileTypeException implements Exception {}

class LocationServiceDisabledException implements Exception {}

class LocationPermissionDeniedException implements Exception {}

class LocationNotFoundException implements Exception {}

class DuplicateUserException implements Exception {}
