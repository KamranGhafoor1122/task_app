
import 'package:flutter/material.dart';
import 'package:task_app/ui/components/loader.dart';

import '../../theme/app_colors.dart';
class CustomButton extends StatelessWidget {
  String title;
  Color? filledColor;
  Color? textColor;
  Function()? onTap;
  double? textSize;
  EdgeInsetsGeometry? padding;
  FontWeight? textFontWeight;
  double? borderRadius;
  bool? loading;
  Widget? leading;
  TextDecoration? textDecoration;


  CustomButton({Key? key,required this.title,required this.onTap,
  this.filledColor=AppColors.primaryColor,
    this.textSize=14,
    this.textColor=AppColors.white,
    this.borderRadius,
    this.textFontWeight=FontWeight.w500,
    this.padding,
    this.leading,
    this.loading=false,
    this.textDecoration
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: filledColor,
        padding: padding,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius??35)
        )
      ),
        child: loading==true?SizedBox(height: 25,width: 25,child: Loader(color: Colors.white,),):
        leading == null ?
        Text(title,style:
    TextStyle(
      fontFamily: "Montserrat",
      fontSize:textSize,
      color: textColor,
      fontWeight: textFontWeight,
      decoration: textDecoration,
    ),): Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leading!,
            const SizedBox(
              width: 15,
            ),
            Text(title,style:
            TextStyle(
              fontFamily: "Montserrat",
              fontSize:textSize,
              color: textColor,
              fontWeight: textFontWeight,
              decoration: textDecoration,
            ),)
          ],
        ));
  }
}
