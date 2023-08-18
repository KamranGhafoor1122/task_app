
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/bloc/auth_bloc.dart';
import 'package:task_app/bloc/auth_events.dart';
import 'package:task_app/bloc/auth_states.dart';
import 'package:task_app/services/Authenticate_Service.dart';
import 'package:task_app/ui/components/filled_button.dart';
import 'package:task_app/ui/components/loader.dart';
import 'package:task_app/ui/pages/home_page.dart';
import 'package:task_app/ui/pages/splash.dart';
import 'package:task_app/utils/navigator.dart';
import '../../Functions/CommonFunctions.dart';
import '../../model/response_model.dart';
import '../../theme/app_colors.dart';
import '../../utils/SizeConfig.dart';
import '../components/text_widget.dart';
import '../components/textfield_widget.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool hidePassword=true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool emptyEmail=false;
  bool emptyPassword =false;
  final AuthBloc _authBloc=AuthBloc(AuthenticateService());


  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
             Positioned.fill(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.safeBlockVertical*3,
                        ),

                        TextWidget(text: "Login",fontWeight: FontWeight.w600,size: 28,),

                        SizedBox(
                          height: SizeConfig.safeBlockVertical,
                        ),

                        TextWidget(text: "Hey there, welcome back!",
                          fontWeight: FontWeight.w400,size: 14,

                        ),

                        SizedBox(
                          height: SizeConfig.safeBlockVertical*8,
                        ),

                        TextFieldWidget(
                          hintText: "Email",
                          inputType: TextInputType.emailAddress,
                          controller: _emailController,
                          leading: Padding(
                            padding: EdgeInsets.all(13),
                            child: SvgPicture.asset("assets/images/svgs/ic_email.svg",
                            height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                        if(emptyEmail)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6,),
                              TextWidget(text: "Email cannot be empty",textColor: Colors.red,size: 10,)
                            ],
                          ),

                        SizedBox(
                          height: SizeConfig.safeBlockVertical*3,
                        ),

                        TextFieldWidget(
                          hintText: "Password",
                          controller: _passwordController,
                          inputType: TextInputType.visiblePassword,
                          trailing: hidePassword?IconButton(icon:SvgPicture.asset("assets/images/svgs/ic_hiddenEye.svg",color: AppColors.grayText,),
                            iconSize: 20,
                            onPressed: (){
                            setState(() {
                              hidePassword=!hidePassword;
                            });
                          },
                          ):IconButton(icon: Icon(Icons.remove_red_eye,color: AppColors.grayText,),
                            iconSize: 20,
                            onPressed: (){
                              setState(() {
                                hidePassword=!hidePassword;
                              });
                            },
                          ),

                          obscureText: hidePassword,
                          leading: Padding(
                            padding: EdgeInsets.all(13),
                            child: SvgPicture.asset("assets/images/svgs/ic_password.svg",
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                        if(emptyPassword)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6,),
                              TextWidget(text: "Password cannot be empty",textColor: Colors.red,size: 10,)
                            ],
                          ),

                        SizedBox(
                          height: 6,
                        ),

                        GestureDetector(
                          onTap: (){
                           // push(context: context, page:const ForgotPassword());
                          },
                          behavior: HitTestBehavior.translucent,
                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: TextWidget(
                                text: "Forgot your password?",
                                textColor: AppColors.grayText,
                              ),
                            ),
                          ),
                        ),


                        SizedBox(
                          height: SizeConfig.safeBlockVertical*17,
                        ),


                        Center(
                          child: Column(
                            children: [

                              
                            BlocConsumer<AuthBloc,AuthState>(
                              bloc: _authBloc,
                              listener: (BuildContext context,AuthState state){
                                print("state : ${state.toString()}");
                                if(state is AuthSuccess){
                                  push(context: context, page: HomePage());
                                  return;
                                }
                                else if(state is AuthFailed){
                                  showSnackBar(context, state.errir);
                                  return;
                                }
                              },
                              builder:(context,state) {
                                if(state is AuthLoading){
                                  return Loader();
                                }
                                else{
                                  return  SizedBox(
                                    height: 55,
                                    width: SizeConfig.screenWidth*0.8,
                                    child: CustomButton(title: "Login",
                                        onTap: loginTapped
                                    ),
                                  );
                                }
    }
                            ),

                              SizedBox(
                                height: SizeConfig.safeBlockVertical*3,
                              ),
                              Row(
                                children: [
                                 const Expanded(child: Divider(
                                    color: AppColors.gray,
                                    thickness: 0.6,
                                  ),
                                  ),

                                 const SizedBox(width: 7,),
                                  TextWidget(text: "Or"),



                                const  SizedBox(width: 7,),

                                 const Expanded(child: Divider(
                                    color: AppColors.gray,
                                    thickness: 0.6,
                                  ),
                                  )
                                ],
                              ),

                              SizedBox(
                                height: SizeConfig.safeBlockVertical*2,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  IconButton(
                                    icon: Image.asset("assets/images/pngs/ic_google.png",),
                                    iconSize: 50,
                                    onPressed: null,
                                  ),

                                  IconButton(
                                    icon: SvgPicture.asset("assets/images/svgs/ic_apple.svg"),
                                    iconSize: 55,
                                    onPressed: null,
                                  ),

                                  IconButton(
                                    icon: SvgPicture.asset("assets/images/svgs/ic_facebook.svg",),
                                    iconSize: 55,
                                    onPressed: null,
                                  ),

                                ],
                              ),




                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  TextWidget(text: "Don't have an account yet?",
                                  size: 12,
                                  ),

                                  Container(
                                    height: 45,
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: (){
                                        //push(context: context, page:const RegisterTypePage());
                                      },
                                      behavior: HitTestBehavior.translucent,
                                      child: TextWidget(text: " Register",
                                        size: 12,
                                        textColor: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),

                                ],
                              )

                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }


  loginTapped()async{
    if(_emailController.text.isEmpty){
      emptyEmail=true;
    }
    else{
      emptyEmail=false;
    }
    if(_passwordController.text.isEmpty){
      emptyPassword=true;
    }
    else{
      emptyPassword=false;
    }

    if(!emptyEmail && !emptyPassword ) {
      _authBloc.add(AuthEventLogin(_emailController.text,_passwordController.text));
      

      /*MyResponse response = await AuthenticateService()
          .loginUserWithEmailPassword(
          email: _emailController.text, password: _passwordController.text);*/
      /*if (response.success && response.data != null) {
        String uid = (response.data as User).uid;
        showSnackBar(context, "Successful Login: $uid");
      } else {
        if (response.message == "TimeOutException") {
          showSnackBar(context, "Ooops! Internet connection lost kindly try to reconnect to internet");
        }
        else if (response.message == "wrong-password") {
          showSnackBar(
              context, "Your password is incorrect, please try again.");
        }
        else if (response.message == "user-not-found") {
          showSnackBar(
              context, "Email address doesn't exit in system. please sign up first.");
        }
        else{
          showSnackBar(
              context, "Something went wrong, try again later");
        }*/
      }
    setState(() {
    });
    }
    


  void init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    });
  }
  }



