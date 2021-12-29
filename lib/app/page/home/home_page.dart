import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/home/square/square_page.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/app/routes/app_pages.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../EmptyPage.dart';
import 'ask/ask_page.dart';
import 'first/first_page.dart';
import 'home_page_controller.dart';

class HomePage extends BaseStatelessView<HomePageController> {
  late TabController _controller;
  var tabs = [Tab(text: "广场"), Tab(text: "首页"), Tab(text: "问答")];
  var pages = [ SquarePage(), FirstPage(),AskPage()];

  @override
  HomePageController putController() {
    return Get.put<HomePageController>(HomePageController());
  }

  @override
  Widget successWidget(controller, BuildContext context) {
    return TabBarView(
      children: pages,
      controller: _controller,
    );
  }

  @override
  void onInitState() {
    getController().showSuccess();
    _controller = TabController(
      length: tabs.length,
      initialIndex: 1,
      vsync: ScrollableState(),
    );
  }

  @override
  AppBar getAppBar() {
    return AppBar(
      actions: [IconButton(onPressed: (){
        Get.toNamed(Routes.SEARCH);
      }, icon: Icon(Icons.search))],
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: R.color().primary,
      title: TabBar(
        labelStyle: TextStyle(fontSize: 48.sp),
        unselectedLabelStyle: TextStyle(fontSize: 36.sp),
        tabs: this.tabs,
        isScrollable: true,
        controller: _controller,
        indicator:BoxDecoration(),
      ),
    );
  }
}
