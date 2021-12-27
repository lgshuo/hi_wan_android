import 'package:flutter/cupertino.dart';
import 'package:flutter_base_master/base/state/page/empty_page.dart';
import 'package:flutter_base_master/base/state/page/error_page.dart';
import 'package:flutter_base_master/base/state/page/loading_page.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../state/base_state_controller.dart';

class StateGetWidget<T extends BaseStateController> extends StatelessWidget {
  final String? tag;
  final T? init;
  final void Function(GetXState<T> state)? initState;
  final Widget Function(T controller, BuildContext context) successWidget;

  StateGetWidget(
      {this.tag, this.initState, this.init, required this.successWidget});

  @override
  Widget build(BuildContext context) {
    return GetX<T>(
      init: this.init,
      initState: this.initState,
      builder: (_) {
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
      },
    );
  }

  T getController() {
    return Get.find<T>(tag: tag);
  }
}
