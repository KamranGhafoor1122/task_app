
import 'package:flutter/material.dart';

push({required BuildContext context,required dynamic page}){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
}

pop({required BuildContext context}){
  Navigator.pop(context);
}