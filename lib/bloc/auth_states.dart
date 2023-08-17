

import 'package:task_app/model/response_model.dart';

abstract class AuthState {
}

class AuthInitial extends AuthState{}
class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState{
  MyResponse? response;
  AuthSuccess({this.response});
}

class AuthFailed extends AuthState{
  String errir;
  AuthFailed({required this.errir});
}

