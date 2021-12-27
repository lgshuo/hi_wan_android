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
}

class ColorRes {
  final MaterialColor primary = MaterialColor(0xfffb7299, const <int, Color>{
    50: const Color(0xffff9bd5),
    10: const Color(0xf0ff9bd5)
  });
  final Color white = Colors.white;
  final Color black = Colors.black;
}
