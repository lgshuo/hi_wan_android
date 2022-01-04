import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/wechat/we_chat_controller.dart';
import 'package:flutter_base_master/app/page/wechat/we_chat_item_page.dart';
import 'package:flutter_base_master/base/state/base_state_controller.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
import 'package:get/get.dart';

class WeChatPage extends BaseStatelessView<WeChatController> {
   TabController? tabController;

  @override
  WeChatController putController() {
    return Get.put<WeChatController>(WeChatController());
  }

  @override
  Widget successWidget(BaseStateController controller, BuildContext context) {
      tabController = TabController(length: getController().tabs.length, vsync: ScrollableState());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Container(
          width: double.infinity,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            controller: tabController,
            tabs: getController().tabs.map((e) {
              return Tab(
                text: e.name,
              );
            }).toList(),
          ),
        ),
      ),
      body: TabBarView(
          controller: tabController!,
          children: getController()
              .tabs
              .map((WeChat) => WeChatItemPage(WeChat.id!))
              .toList()),
    );
  }

  @override
  void onInitState() {
    getController().showLoading();
    getController().getTabs();
  }

  WeChatController getController() {
    return Get.find<WeChatController>();
  }
}
