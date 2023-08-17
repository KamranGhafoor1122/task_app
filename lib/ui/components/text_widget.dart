
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class TextWidget extends StatelessWidget {
  String text;
  TextAlign? textAlign;
  int? maxLines;
  Color? textColor;
  TextOverflow? textOverflow;
  double? size;
  bool? autoSizedText;
  FontWeight? fontWeight;
  TextDecoration? decoration;


  TextWidget({required this.text, this.textAlign, this.maxLines, this.textOverflow,
    this.textColor=AppColors.darkText,this.autoSizedText=false,
      this.size=14, this.fontWeight=FontWeight.w400, this.decoration});

  @override
  Widget build(BuildContext context) {
    return
    Text(text,textAlign: textAlign,maxLines: maxLines,
    overflow: textOverflow,
      style: TextStyle(
        fontFamily: "Montserrat",
        fontSize:size,
        color: textColor,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}



