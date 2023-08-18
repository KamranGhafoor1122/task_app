
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/ui/pages/login_page.dart';
import 'package:task_app/utils/navigator.dart';

import '../../theme/app_colors.dart';
import '../../utils/SizeConfig.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {



  @override
  void initState() {
    // TODO: implement initState
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        color: AppColors.primaryOpaque,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const Spacer(flex: 4,),
              SvgPicture.asset("assets/images/svgs/ic_app_logo.svg",),
              SizedBox(
                  width: SizeConfig.safeBlockHorizontal*45,
                  height: SizeConfig.safeBlockVertical*15,
                  child: Image.asset("assets/images/pngs/ic_agelessHumans.png")),


             //const Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }

  void navigate() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 2),(){
        push(context: context, page:const LoginPage());
      });

    });
  }




}
