import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
import 'package:get/get.dart';

import 'first/first_page.dart';
import 'home_page_controller.dart';

class HomePage extends BaseStatelessView<HomePageController> {
  var tabs = [
    Tab(text: "广场"),
    Tab(text: "首页"),
    Tab(text: "问答")
  ];

  @override
  HomePageController putController() {
    return Get.put<HomePageController>(HomePageController());
  }

  @override
  Widget successWidget(controller, BuildContext context) {
    return TabBarView(
        children: [FirstPage(), FirstPage(), FirstPage()],);
  }

  @override
  void onInitState() {
    getController().showSuccess();
  }

  @override
  AppBar getAppBar() {
    return AppBar(
      backgroundColor: R.color().primary,
      bottom: TabBar(
        tabs: this.tabs,
        isScrollable: true,

      ),
    );
  }
}
