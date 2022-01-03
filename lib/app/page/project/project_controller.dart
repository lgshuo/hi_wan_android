import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/app/data/project.dart';
import 'package:flutter_base_master/base/http/request/base_request.dart';
import 'package:flutter_base_master/base/http/request/param_utils.dart';
import 'package:flutter_base_master/base/http/request/request_api.dart';
import 'package:flutter_base_master/base/widget/list_view/base_refresh_list_view_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ProjectController extends BaseRefreshListViewController<HomeListBean> {
  var tabs = <ProjectBean>[].obs;
  int? id;
  void getTabs() {
    Request.get<dynamic>(RequestApi.project, null, success: (data) {
      data.forEach((element) {
        tabs.add(ProjectBean.fromJson(element));
      });
      showSuccess();
    });
  }

  void setCid(int id) {
    this.id = id;
  }

  @override
  void loadData() {
    if (id ==null) {
    showError();
      return;
    }
    var params = ParamUtils().add("cid", id).params;
    Request.get<dynamic>(RequestApi.getProjectList(page),params, success:(data){
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
