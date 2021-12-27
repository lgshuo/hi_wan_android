import 'package:flutter/cupertino.dart';

class ImageHelper{
  static Image assest(String url,{BoxFit fit = BoxFit.cover,double? width,double? height}){
    return Image.asset("assets/images/${url}",fit: fit,width: width,height: height);
  }
}