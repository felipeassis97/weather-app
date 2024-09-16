import 'package:dio/dio.dart';
import 'package:weather_app/common/services/client/client_response.dart';
import 'package:weather_app/common/services/client/i_client_service.dart';

class DioClientService implements IClientService {
  late final Dio _client;

  DioClientService() {
    _client = Dio();
  }

  @override
  Future<ClientResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _client.get(
        path,
        options: Options(
          headers: headers,
          validateStatus: (status) =>
              status != null && (status >= 200 && status <= 201),
        ),
      );
      return ClientResponse.fromDioResponse(response);
    } on DioException catch (e) {
      throw ClientResponse.fromDioException(e);
    } on Exception catch (e) {
      throw ClientResponse.fromUnknownException(e);
    }
  }
}
