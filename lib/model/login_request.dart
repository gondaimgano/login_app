class LoginRequest{
  String username;
  String password;
  LoginRequest({this.username,this.password});

  Map toJson(){
    return {
      "username":username,
      "password":password,
    };
  }
}