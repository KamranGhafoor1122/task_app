

import 'package:flutter/material.dart';

class AssetImageWidget extends StatelessWidget {
  String image;
  BorderRadiusGeometry? borderRadius;
  bool? rounded=false;
  bool? circular=false;
  double? height;
  double? width;
  BoxFit? fit;

  AssetImageWidget({required this.image,
  this.rounded,
  this.circular,
  this.borderRadius
  ,this.width = 50,this.height = 50,fit=BoxFit.cover,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: circular == true ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: rounded == true ? borderRadius:null,
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: fit
        )
      ),
    );
  }
}
