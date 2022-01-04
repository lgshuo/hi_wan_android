import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/app/page/project/project_controller.dart';
import 'package:flutter_base_master/app/widget/common_list_item.dart';
import 'package:flutter_base_master/base/widget/refresh_list_view_widget.dart';
import 'package:get/get.dart';

class WeChatItemPage extends StatefulWidget {
  int id;
  WeChatItemPage(this.id);
  @override
  _WeChatPageItemState createState() {
    return _WeChatPageItemState();
  }
}

class _WeChatPageItemState extends State<WeChatItemPage> with  AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return RefreshListViewWidget<ProjectController,HomeListBean>(
        init: Get.put<ProjectController>(ProjectController(),tag: "${widget.id}"),
        initState: (_){
          getController().setCid(widget.id);
          getController().showLoading();
          getController().loadData();
        },
        getController: (){
          return Get.find<ProjectController>(tag:"${widget.id}");
        },
        itemView: (context,index,data){
          return CommonListItem(homeListBean: data,isAsk: true,bgColor: Colors.red);
        }
        );
  }

  ProjectController getController(){
    return Get.find<ProjectController>(tag:"${widget.id}");
  }
  @override
  bool get wantKeepAlive => true;
}
