
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_app/theme/app_colors.dart';
import 'package:task_app/ui/components/text_widget.dart';
class TextFieldWidget extends StatelessWidget {
  double? height;
  double? width;
  Widget? leading;
  Widget? trailing;
  double? fontSize;
  Color? textColor;
  bool? enabled;
  Color? filledColor;
  Color? cursorColor;
  String? hintText;
  TextStyle? hintTextStyle;
  BorderRadius? borderRadius;
  BorderSide? borderSide;
  TextAlign textAlign;
  bool? obscureText;
  String? counterText;
  TextInputType? inputType;
  FontWeight? fontWeight;
  TextEditingController? controller;
  TextInputFormatter? inputFormatter;
  List<TextInputFormatter>? inputFormatters;
  Function(String input)? oncChange;
  Function(String input)? onValidate;
  bool? error;
  int? maxLines;
  TextInputAction? textInputAction;
  String? errorText;
  Function? trailingTapped;

  int? maxLength;

   TextFieldWidget({Key? key, this.height,this.width=double.infinity,
     this.fontSize=14,
     this.fontWeight=FontWeight.w400,
     this.textColor=AppColors.darkText,
     this.hintText,
     this.enabled=true,
     this.counterText,
     this.hintTextStyle,
     this.maxLength,
     this.filledColor=AppColors.textFieldBg,
     this.obscureText=false,
     this.controller,
     this.cursorColor,
     this.error=false,
     this.textInputAction,
     this.inputFormatters,
     this.borderRadius,
     this.oncChange,
     this.onValidate,
     this.borderSide,
     this.textAlign=TextAlign.start,
     this.inputType,
     this.errorText,
     this.maxLines=1,
     this.trailingTapped,
     this.inputFormatter,
     this.leading,this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize:fontSize,
              color: textColor,
              fontWeight: fontWeight,
            ),
            inputFormatters: inputFormatters !=null ? inputFormatters : inputFormatter==null?null:[
              inputFormatter!,
            ],
            textAlign: textAlign,
            maxLength: maxLength,
            maxLines: maxLines,
            controller: controller,
            enabled: enabled,
           textInputAction: textInputAction,
           // validator: (input)=>onValidate!=null?onValidate!(input??""):null,
            onChanged: (input)=>oncChange!=null?oncChange!(input):null,
            keyboardType: inputType,
            obscureText: obscureText??false,
            cursorColor: cursorColor ?? AppColors.darkText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius??BorderRadius.circular(10.0),
                borderSide: borderSide??const BorderSide(
                  color: AppColors.textFieldBorder,
                  width: 1
                )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius??BorderRadius.circular(10.0),
                  borderSide:borderSide??const  BorderSide(
                      color: AppColors.textFieldBorder,
                      width: 1
                  )
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius??BorderRadius.circular(10.0),
                  borderSide: borderSide??const BorderSide(
                      color: AppColors.textFieldBorder,
                      width: 1
                  )
              ),
              counterText: counterText,
              filled: true,
              fillColor: filledColor,
              hintText: hintText,
              errorBorder: InputBorder.none,
              hintStyle: hintTextStyle ??const TextStyle(
                fontFamily: "Montserrat",
                fontSize:12,
                color: AppColors.grayText,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: leading,
              suffixIcon: trailing,
            ),
          ),
        ),

        if(error!)...[
         const SizedBox(
            height: 5,
          ),
          TextWidget(text: errorText??"Field cannot be empty",size: 11,textColor: Colors.red,),
        ]







      ],
    );
  }
}
