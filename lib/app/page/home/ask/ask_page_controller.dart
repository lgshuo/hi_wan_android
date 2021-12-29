import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/base/http/request/base_request.dart';
import 'package:flutter_base_master/base/http/request/request_api.dart';
import 'package:flutter_base_master/base/widget/list_view/base_refresh_list_view_controller.dart';

class AskPageController extends BaseRefreshListViewController{
  @override
  void loadData() {
    Request.get<dynamic>(RequestApi.getaskList(page),null, success:(data){
      data["datas"].forEach((element) {
        datas.add(HomeListBean.fromJson(element));
      });
      refreshCompleted();
      loadCompleted();
      showSuccess();
      if (page>=data["pageCount"]) {
        loadNoMore();
      }
    });
  }
}