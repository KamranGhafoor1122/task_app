import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../model/response_model.dart';

class AuthenticateService{
  final _firebaseAuth = FirebaseAuth.instance;
  Future<MyResponse> createUserWithEmailPassword({required String email,required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.toLowerCase(),
        password: password,
      );

      if(credential.user ==null){
        return MyResponse(success: false,message: "Something went wrong",data: null);
      }
      else{
        return MyResponse(success: true,message: "",data: credential.user);
      }
    } on FirebaseAuthException catch (e,st) {

      print("Exception createUserWithEmailPassword: $e \n email:$email  password:$password \n Stacktrace: $st");

      return MyResponse(success: false,message: e.message??"something went wrong!",data: null);
    } catch (ex,st) {
      print("Exception in firebase auth: $ex");
      return MyResponse(success: false,message: ex.toString(),data: null);
    }
  }

  Future<MyResponse> loginUserWithEmailPassword({required String email,required String password}) async {
    try {

        final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.toLowerCase(),
          password: password,
        ).timeout(Duration(seconds: 30));

          if(credential.user ==null){
            return MyResponse(success: false,message: "Something went wrong",data: null);
          }
          else{
            return MyResponse(success: true,message: "",data: credential.user);
          }


        } on TimeoutException catch(e){
          return MyResponse(success: false,message: "TimeOutException",data: null);
        }

        on FirebaseAuthException catch (e) {

          print("login exception:$e");
          if(e.code=="wrong-password"){
            // return MyResponse(success: false,message: "Your password is incorrect, please try again.",data: null);
            return MyResponse(success: false,message: "wrong-password",data: null);
          }
          if(e.code=="user-not-found"){
            // return MyResponse(success: false,message: "Your password is incorrect, please try again.",data: null);
            return MyResponse(success: false,message: "user-not-found",data: null);
          }
          else{
            return MyResponse(success: false,message: e.message??"something went wrong!",data: null);
          }
        } catch (e) {
          print("Exception in firebase auth: $e");
          return MyResponse(success: false,message: e.toString(),data: null);
        }







  }

}