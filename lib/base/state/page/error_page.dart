import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:lottie/lottie.dart';

import '../base_state_controller.dart';
class ErrorPage extends StatefulWidget {
  BaseStateController controller;
  ErrorPage(this.controller,{Key? key}) : super(key: key);

  @override
  _ErrorPageState createState() {
    return _ErrorPageState();
  }
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Lottie.asset(R.drawable().error)
      ),
      onTap: (){
        widget.controller.showLoading();
      },
    );
  }
}