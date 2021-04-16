import 'package:chopper/chopper.dart';
import 'package:login_app/model/login_request.dart';
import 'package:login_app/service/app_service.dart';

class AppController{
  final AppServiceApiService _apiService;

  AppController(this._apiService);
  Future<Response> login(LoginRequest request) async {
    request.toJson();
    var resp = await _apiService.getTodos();

    return resp;
  }

}