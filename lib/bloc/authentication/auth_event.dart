abstract class AuthEvent {}

class AuthLoginRequest extends AuthEvent {
  String username;
  String password;

  AuthLoginRequest(this.username, this.password);
}


class AuthRegisterRequest extends AuthEvent {
  String username;
  String password;
  String passwordConfirm;

  AuthRegisterRequest(this.username, this.password,this.passwordConfirm);
}