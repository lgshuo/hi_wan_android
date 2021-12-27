import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
import 'package:flutter_base_master/base/widget/list_view/list_view_footer.dart';
import 'package:flutter_base_master/base/widget/list_view/list_view_head.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'base_refresh_list_view_controller.dart';

abstract class BaseRefreshListViewPage<T extends BaseRefreshListViewController>
    extends BaseStatelessView<T> {
  @override
  Widget successWidget(T controller, BuildContext context) {
    return SmartRefresher(
      controller: controller.refreshController,
      enablePullUp: true,
      physics: BouncingScrollPhysics(),
      header: ListViewHead(),
      footer: ListViewFooter(),
      onRefresh: () {
        controller.refresh();
      },
      onLoading: () {
        controller.loadMore();
      },
      child: listBuilder() == null
          ? ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                child: itemView(context, index),
                onTap: (){
                  onItemClick(context,index);
                },
              ),
              itemCount: controller.datas.length,
            )
          : listBuilder(),
    );
  }

  Widget? listBuilder() {
    return null;
  }
  Widget itemView(BuildContext context, int index);

  void onItemClick(BuildContext context, int index);
}


