import 'package:flutter/cupertino.dart';
import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/app/page/home/ask/ask_page_controller.dart';
import 'package:flutter_base_master/app/page/home/square/square_page_controller.dart';
import 'package:flutter_base_master/app/widget/common_list_item.dart';
import 'package:flutter_base_master/base/widget/refresh_list_view_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class AskPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AskPageState();
  }
}
class AskPageState extends State<AskPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return RefreshListViewWidget<AskPageController,HomeListBean>(
        init:Get.put<AskPageController>(AskPageController()),
        initState: (_){
          getController().loadData();
          getController().showLoading();
        },
        itemView: (context,index,data){
          return CommonListItem(homeListBean: data);
        },
    );
  }
  AskPageController getController(){
    return Get.find<AskPageController>();
  }
  @override
  bool get wantKeepAlive => true;
}