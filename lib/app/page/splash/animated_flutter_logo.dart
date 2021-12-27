import 'package:flutter/cupertino.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/base/utils/image_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedFlutterLogo extends AnimatedWidget {
  AnimatedFlutterLogo({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return AnimatedAlign(
      alignment: Alignment(0, 0.2 + animation.value * 0.3),
      duration: Duration(milliseconds: 10),
      curve: Curves.bounceOut,
      child: ImageHelper.assest(R.drawable().splash_flutter,
          width: 560.w, height: 240.h,fit: BoxFit.fill),
    );
  }
}
