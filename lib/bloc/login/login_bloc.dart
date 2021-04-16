import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:login_app/controller/app_controller.dart';
import 'package:login_app/model/login_request.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AppController _controller;
  LoginBloc(this._controller) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
     if (event is PressLogin){
       yield* _loginToState(event);
     }
  }

  Stream<LoginState> _loginToState(PressLogin event) async* {
    try{
      yield LoginInProgress();
     Response response= await _controller.login(event.request);
     if(response.isSuccessful){

       yield LoginSucceeded();
     }
     else
       //Todo response.body to convert from json to an class Object
       throw Exception(response.body);
    }catch(ex){
        yield LoginFailure(ex.toString());
    }
  }
}
