import 'package:weather_app/common/services/client/client_response.dart';

abstract interface class IClientService {
  Future<ClientResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
}
