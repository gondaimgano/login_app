part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginInProgress extends LoginState{
  @override
  List<Object> get props => [];

}


class LoginSucceeded extends LoginState{
  @override
  List<Object> get props => [];

}

class LoginFailure extends LoginState{
  final String message;

  LoginFailure(this.message);


  @override
  List<Object> get props => [];

}
