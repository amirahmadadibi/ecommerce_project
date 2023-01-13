import 'package:dartz/dartz.dart';

abstract class AuthState {}


class AuthInitiateState extends AuthState {}


class AuthLoadingState extends AuthState {}

class AuthResponseState extends AuthState {
  Either<String, String> reponse;
  AuthResponseState(this.reponse);
}
