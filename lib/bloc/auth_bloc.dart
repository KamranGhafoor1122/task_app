

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/bloc/auth_events.dart';
import 'package:task_app/bloc/auth_states.dart';
import 'package:task_app/model/response_model.dart';

import '../services/Authenticate_Service.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  //AuthBloc(super.initialState);

  final AuthenticateService _authenticateService;

  AuthBloc(this._authenticateService) : super(AuthInitial()){
    on<AuthEventLogin>((event, emit) async{
       emit(AuthLoading());
         MyResponse response =  await _authenticateService.loginUserWithEmailPassword(email: event.email, password: event.password);

         print("resp ${response.toMap()}");
         if(response.success == true){
           emit(AuthSuccess(response: response));
         }
         else{
           emit(AuthFailed(errir: response.message));
         }



         });
  }

  
  

  
}