import 'package:dio/dio.dart';

final class ClientResponse {
  final String? message;
  final int? statusCode;
  final dynamic data;
  final StackTrace? stackTrace;

  const ClientResponse({
    this.statusCode,
    this.data,
    this.message,
    this.stackTrace,
  });

  factory ClientResponse.fromDioResponse(Response response) {
    return ClientResponse(
      data: response.data,
      statusCode: response.statusCode,
      message: response.statusMessage,
    );
  }

  factory ClientResponse.fromDioException(DioException response) {
    return ClientResponse(
      data: response.response,
      stackTrace: response.stackTrace,
      statusCode: response.response?.statusCode,
      message: 'MESSAGE: ${response.message} | TYPE: ${response.type.name}',
    );
  }

  factory ClientResponse.fromUnknownException(Exception exception) {
    return ClientResponse(
      data: exception,
      message: 'UNKNOWN ERROR',
    );
  }
}
