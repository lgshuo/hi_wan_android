import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/app/page/project/project_controller.dart';
import 'package:flutter_base_master/app/page/system/system_page_controller.dart';
import 'package:flutter_base_master/app/widget/common_list_item.dart';
import 'package:flutter_base_master/base/widget/refresh_list_view_widget.dart';
import 'package:get/get.dart';

class SystemContentListPage extends StatefulWidget {
  int id;
  SystemContentListPage(this.id);
  @override
  _SystemContentListPageState createState() {
    return _SystemContentListPageState();
  }
}

class _SystemContentListPageState extends State<SystemContentListPage> with  AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {

    return RefreshListViewWidget<SystemPageController,HomeListBean>(
        init: Get.put<SystemPageController>(SystemPageController(),tag: "${widget.id}"),
        initState: (_){
          getController().setCid(widget.id);
          getController().showLoading();
          getController().loadData();
        },
        getController:getController,
        itemView: (context,index,data){
          return CommonListItem(homeListBean: data,isAsk: true,bgColor: Colors.blue);
        }
    );
  }
  SystemPageController getController(){
    return Get.find<SystemPageController>(tag:"${widget.id}");
  }

  @override
  bool get wantKeepAlive => true;
}
