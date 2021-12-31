import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class R {
  static PicRes drawable() {
    return PicRes();
  }

  static ColorRes color() {
    return ColorRes();
  }
}

class PicRes {
  final String loading = "assets/lottie/loading.json";
  final String empty = "assets/lottie/empty.json";
  final String error = "assets/lottie/error.json";
  final String head = "assets/gif/head.gif";
  final String splash_flutter = "splash_flutter.png";
  final String splash_bg = "splash_bg.png";
  final String splash_fun = 'splash_fun.png';
  final String splash_android = 'splash_android.png';


}

class ColorRes {
  final MaterialColor primary = MaterialColor(0xF86706FF, const <int, Color>{
    50: const Color(0xF87D2FF8),
    10: const Color(0xF89C77EA),
    1: const Color(0xF8D0C5FA)
  });
  final MaterialColor headline = MaterialColor(0xff000000, const <int, Color>{

  });

  final Color white = Colors.white;
  final Color black = Colors.black;
  static const Color B8C0D4 = Color(0xFFB8C0D4);
  static const color_B8C0D4 = Color(0xFFB8C0D4);
  static const color_1A2F51 = Color(0xFF1A2F51);


}
