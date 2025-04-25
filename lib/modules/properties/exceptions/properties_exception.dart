abstract class PropertiesException implements Exception {}

class CouldNotFetchPropertiesException implements PropertiesException {
  final String message;

  CouldNotFetchPropertiesException(this.message);

  @override
  String toString() => message;
}
