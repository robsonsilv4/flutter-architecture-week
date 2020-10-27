import 'package:dio/dio.dart';

import '../interfaces/http_client_service_interface.dart';

class HttpClientService implements IHttpClient {
  final dio = Dio();

  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
