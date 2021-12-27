import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/app/routes/app_pages.dart';
import 'package:flutter_base_master/base/utils/image_helper.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'animated_android_logo.dart';
import 'animated_count_down.dart';
import 'animated_flutter_logo.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _logoController;
  late AnimationController _countdownController;


  @override
  void initState() {
    _logoController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(curve: Curves.easeInOutBack, parent: _logoController));
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _logoController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _logoController.forward();
      }
    });
    _logoController.forward();
    _countdownController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _countdownController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      ImageHelper.assest(R.drawable().splash_bg, fit: BoxFit.fill),
      AnimatedFlutterLogo(
        animation: _animation,
      ),
      Align(
        alignment: Alignment(0.0, 0.7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AnimatedAndroidLogo(
              animation: _animation,
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.MAIN);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
              margin: EdgeInsets.only(right: 40.w, bottom: 40.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.h),
                color: Colors.black.withAlpha(100),
              ),
              child: AnimatedCountdown(
                context: context,
                animation: StepTween(begin: 5, end: 0)
                    .animate(_countdownController),
              ),
            ),
          ),
        ),
      )
    ]);
  }

  @override
  void dispose() {
    _logoController.dispose();
    _countdownController.dispose();
    super.dispose();
  }

}
