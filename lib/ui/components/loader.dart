
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class Loader extends StatelessWidget {
  Color? color;
   Loader({Key? key,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircularProgressIndicator(
      strokeWidth: 1,
      valueColor: AlwaysStoppedAnimation<Color>(color??AppColors.primaryColor,),
    );
  }
}
