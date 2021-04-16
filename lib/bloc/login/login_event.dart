part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}
class PressLogin extends LoginEvent{
  final LoginRequest request;

  PressLogin(this.request);
  @override
  List<Object> get props => [];
}