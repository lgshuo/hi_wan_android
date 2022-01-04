import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/data/constant.dart';
import 'package:flutter_base_master/app/page/system/system_page_controller.dart';
import 'package:flutter_base_master/app/routes/app_pages.dart';
import 'package:flutter_base_master/base/widget/state_get_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class SystemPage extends StatefulWidget {
  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return StateGetWidget(
        init: Get.put<SystemPageController>(SystemPageController()),
        initState: (_) {
          getController().showLoading();
          getController().getSystemList();
        },
        getController: getController,
        successWidget: (controller, context) {
          return _buildBodyContent();
        });
  }

  SystemPageController getController() {
    return Get.find<SystemPageController>();
  }

  Widget _buildBodyContent() {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow[900],title: Text("体系"),centerTitle: true),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return StickyHeader(
              header: _buildStickyHeader(index),
              content: _buildStickyContent(index));
        },
        itemCount: getController().systemList.length,
      ),
    );
  }

  _buildStickyHeader(int index) {
    return PhysicalModel(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1.h, color: Colors.grey[200]!.withOpacity(0.5)))),
        alignment: Alignment.centerLeft,
        child: Text(
          getController().systemList[index].name??"",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _buildStickyContent(int index) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Wrap(
        spacing: 15.0.w,
        runSpacing: 10.0.h,
        children: getController().systemList[index].children!.map((e) {
          return ActionChip(
            label: Text(e.name??""),
            elevation: 5.0,
            backgroundColor:
                Colors.primaries[Random().nextInt(Colors.primaries.length)],
            onPressed: () {
              //点击选项
              Get.toNamed(Routes.SYSTEM_CONTENT, arguments: {
                Constant.SELECT_TITLE_INDEX:
                    getController().systemList[index].children!.indexOf(e),
              Constant.SELECT_TITLE: getController().systemList[index]
              });
            },
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
