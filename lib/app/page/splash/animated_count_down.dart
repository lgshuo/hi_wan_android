import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AnimatedCountdown extends AnimatedWidget {
  final Animation<int> animation;

  AnimatedCountdown({key,required this.animation, context})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.toNamed(Routes.MAIN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = animation.value + 1;
    return Text(
      (value == 0 ? '' : '$value | 跳过'),
      style: TextStyle(color: Colors.white,fontSize: 30.sp,fontWeight: FontWeight.normal,decoration: TextDecoration.none),
    );
  }
}