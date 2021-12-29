import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
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
  Widget? refreshChild;

  Widget Function(BuildContext context, int index, D data)? itemView;


  RefreshListViewWidget(
      {this.tag,
        required this.init,
        required this.initState,
      this.refreshChild,
      required this.itemView,
      });

  @override
  Widget build(BuildContext context) {
    return StateGetWidget<T>(
        tag: tag,
        initState: initState,
        init: init,
        successWidget: (controller, context) {
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
              child: refreshChild == null
                  ? ListView.builder(
                      itemBuilder: (context, index) => itemView!(context, index, controller.datas[index]),
                      itemCount: controller.datas.length,
                    )
                  : refreshChild!);
        });
  }
}
