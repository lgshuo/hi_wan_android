import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:lottie/lottie.dart';
class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Lottie.asset(R.drawable().loading)
    );
  }
}