import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/data/constant.dart';
import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/app/data/system_list_bean.dart';
import 'package:flutter_base_master/app/page/system/system_content_list_page.dart';
import 'package:flutter_base_master/app/page/system/system_page_controller.dart';
import 'package:flutter_base_master/app/widget/common_list_item.dart';
import 'package:flutter_base_master/base/widget/refresh_list_view_widget.dart';
import 'package:get/get.dart';

class SystemContentPage extends StatefulWidget {
  @override
  _SystemContentPageState createState() {
    return _SystemContentPageState();
  }
}

class _SystemContentPageState extends State<SystemContentPage> with AutomaticKeepAliveClientMixin{
  late SystemListBean systemListBean;
  late  int index;
  late  TabController _tabController;
  @override
  void initState() {
    systemListBean = Get.arguments[Constant.SELECT_TITLE];
    index = Get.arguments[Constant.SELECT_TITLE_INDEX];
    _tabController = TabController(length: systemListBean.children!.length, vsync: ScrollableState(), initialIndex: index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(systemListBean.name ?? ""),
            bottom: TabBar(
              isScrollable: true,
              tabs: systemListBean.children!.map((e) {
                return Tab(
                  text: e.name,
                );
              }).toList(),
              controller: _tabController,
            ),
        ),
        body: TabBarView(
          children: systemListBean.children!.map((e) {
            return SystemContentListPage(e.id!);
          }).toList(),
          controller: _tabController,
        )
    );
  }
  @override
  bool get wantKeepAlive =>true;
}