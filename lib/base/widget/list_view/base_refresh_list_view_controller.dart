import 'package:flutter_base_master/base/http/request/param_utils.dart';
import 'package:flutter_base_master/base/state/base_state_controller.dart';
import 'package:flutter_base_master/base/utils/toast_utils.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseRefreshListViewController<T> extends BaseStateController {
  RefreshController refreshController = RefreshController();
  var listLoad = 1.obs;
  var datas = <T>[].obs;
  var page = 0;

  void loadMore() {
    page++;
    loadData();
  }


  void refresh() {
    page=0;
    datas.clear();
    loadData();
  }

  void loadCompleted() {
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    }
  }

  void refreshCompleted() {
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }
  }
  void loadNoMore(){
    refreshController.footerMode=RefreshNotifier(LoadStatus.noMore);
    ToastUtils.show("没有更多数据了");
  }
  void loadData();
}
