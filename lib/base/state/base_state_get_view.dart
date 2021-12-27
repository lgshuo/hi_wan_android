import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/base/state/page/empty_page.dart';
import 'package:flutter_base_master/base/state/page/error_page.dart';
import 'package:flutter_base_master/base/state/page/loading_page.dart';
import 'package:get/get.dart';

import 'base_state_controller.dart';

abstract class BaseStatelessView<T extends BaseStateController>
    extends StatelessWidget {
  final String? tag = null;

  Widget successWidget(T controller, BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GetX<T>(
      autoRemove: false,
      init: putController(),
      initState: (_) {
        onInitState();
      },
      builder: (_) {
        return Scaffold(
          appBar: getAppBar(),
          body: _bodyWidget(context),
        );
      },
    );
  }

  T putController();

  void onInitState() {
    var controller = getController();
    controller.showLoading();
  }

  T getController() {
    return Get.find<T>(tag: tag);
  }

  Widget _bodyWidget(BuildContext context) {
    var controller = getController();
    switch (controller.loadState.value) {
      case BaseStateController.LOADING:
        return LoadingPage();
      case BaseStateController.SUCCESS:
        return successWidget(controller, context);
      case BaseStateController.EMPTY:
        return EmptyPage();
      case BaseStateController.ERROR:
        return ErrorPage(controller);
    }
    return Text("未知状态");
  }

  AppBar? getAppBar(){
    return null;
  }
}
