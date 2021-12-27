import 'package:flutter/cupertino.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/base/utils/image_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedAndroidLogo extends AnimatedWidget {
  AnimatedAndroidLogo({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ImageHelper.assest(R.drawable().splash_fun,
            width: 280.w * animation.value,
            height: 160.h * animation.value,
            fit: BoxFit.fill),
        ImageHelper.assest(R.drawable().splash_android,
            width: 400.w * (1 - animation.value),
            height: 160.h * (1 - animation.value),
            fit: BoxFit.fill),
      ],
    );
  }
}
