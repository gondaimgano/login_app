// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$AppServiceApiService extends AppServiceApiService {
  _$AppServiceApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = AppServiceApiService;

  Future<Response> getTodos() {
    final $url = '/todos';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
