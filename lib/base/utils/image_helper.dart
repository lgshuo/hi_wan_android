import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ImageHelper{
  static Image assest(String url,{BoxFit fit = BoxFit.cover,double? width,double? height}){
    return Image.asset("assets/images/${url}",fit: fit,width: width,height: height);
  }
  static SvgPicture svgAssest(String url,{double? width,double? height}){
    return SvgPicture.asset("assets/svg/${url}",width: width,height: height);
  }
}