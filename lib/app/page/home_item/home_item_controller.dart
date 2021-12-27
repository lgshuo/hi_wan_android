import 'package:flutter_base_master/app/data/home_list_data.dart';
import 'package:flutter_base_master/base/http/request/base_request.dart';
import 'package:flutter_base_master/base/http/request/param_utils.dart';
import 'package:flutter_base_master/base/http/request/request_api.dart';
import 'package:flutter_base_master/base/state/base_state_controller.dart';
import 'package:flutter_base_master/base/widget/list_view/base_refresh_list_view_controller.dart';

class HomeItemController extends BaseRefreshListViewController<MainListData> {
  String title = "";

  @override
  void loadData() {
    if (page == 1) {
      datas.clear();
    }
    String userUuid = Uri.encodeComponent("5C:C3:07:74:73:4C");
    var params = ParamUtils()
        .add("userUuid", userUuid)
        .add("page", page)
        .add("infoColumnCode", getInfoColumnCode())
        .add("userCode", "")
        .params;
    Request.post<dynamic>(RequestApi.mainListData, params, success: (data) {
      data.forEach((element) {
        datas.add(MainListData.fromJson(element));
      });
      loadCompleted();
      refreshCompleted();
      showSuccess();
    } /*,fail: (code,message){
      showError();
    }*/
        );
  }

  String getInfoColumnCode() {
    var infoColumnCode = "2ea80aad-9073-11ea-ad3d-00163e0a0789";
    switch (title) {
      case '时事':
        infoColumnCode = "2ea80aad-9073-11ea-ad3d-00163e0a0789";
        break;
      case '财经':
        infoColumnCode = "2ea80735-9073-11ea-ad3d-00163e0a0789";
        break;
      case '军事':
        infoColumnCode = "2ea8078d-9073-11ea-ad3d-00163e0a0789";
        break;
      case '母婴':
        infoColumnCode = "2ea8025b-9073-11ea-ad3d-00163e0a0789";
        break;
      case '健康':
        infoColumnCode = "2ea805d8-9073-11ea-ad3d-00163e0a0789";
        break;
    }
    return infoColumnCode;
  }

  void setTitle(title) {
    this.title = title;
  }
}
