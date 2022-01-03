import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/base/widget/list_view/list_view_footer.dart';
import 'package:flutter_base_master/base/widget/list_view/list_view_head.dart';
import 'package:flutter_base_master/base/widget/state_get_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'list_view/base_refresh_list_view_controller.dart';

class RefreshListViewWidget<T extends BaseRefreshListViewController, D>
    extends StatelessWidget {
  final String? tag;
  final T? init;
  final void Function(GetXState<T> state)? initState;
  Widget? Function()? refreshChild;
  T Function() getController;

  Widget Function(BuildContext context, int index, D data)? itemView;


  RefreshListViewWidget(
      {this.tag,
        required this.init,
        required this.initState,
        required this.getController,
      this.refreshChild,
      required this.itemView,
      });

  @override
  Widget build(BuildContext context) {
    return StateGetWidget<T>(
        tag: tag,
        initState: initState,
        init: init,
        successWidget: (_, context) {
          return SmartRefresher(
              controller: getController().refreshController,
              enablePullUp: true,
              physics: BouncingScrollPhysics(),
              header: ListViewHead(),
              footer: ListViewFooter(),
              onRefresh: () {
                getController().refresh();
              },
              onLoading: () {
                getController().loadMore();
              },
              child: refreshChild == null
                  ? ListView.builder(
                      itemBuilder: (context, index) => itemView!(context, index, getController().datas[index]),
                      itemCount: getController().datas.length,
                    )
                  : refreshChild!());
        });
  }
}
