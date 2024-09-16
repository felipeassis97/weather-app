abstract interface class IWeatherException {
  final String message;
  const IWeatherException(this.message);
}

class DecoderException implements IWeatherException {
  @override
  final String message;
  const DecoderException({required this.message});
}

class TimeOutException implements IWeatherException {
  @override
  final String message;
  const TimeOutException({required this.message});
}

class InternalServerError implements IWeatherException {
  @override
  final String message;
  const InternalServerError({required this.message});
}

class CacheException implements IWeatherException {
  @override
  final String message;
  const CacheException({required this.message});
}
