import 'package:flutter/cupertino.dart';
import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/app/page/home/square/square_page_controller.dart';
import 'package:flutter_base_master/app/widget/common_list_item.dart';
import 'package:flutter_base_master/base/widget/refresh_list_view_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SquarePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SquarePageState();
  }
}
class SquarePageState extends State<SquarePage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return RefreshListViewWidget<SquarePageController,HomeListBean>(
        init:Get.put<SquarePageController>(SquarePageController()),
        initState: (_){
          getController().loadData();
          getController().showLoading();
        },
        itemView: (context,index,data){
          return CommonListItem(homeListBean: data);
        },
    );
  }
  SquarePageController getController(){
    return Get.find<SquarePageController>();
  }
  @override
  bool get wantKeepAlive => true;
}