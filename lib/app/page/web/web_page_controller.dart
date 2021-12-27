import 'package:flutter/cupertino.dart';
import 'package:flutter_base_master/app/data/web_bean.dart';
import 'package:flutter_base_master/base/http/request/base_request.dart';
import 'package:flutter_base_master/base/http/request/param_utils.dart';
import 'package:flutter_base_master/base/http/request/request_api.dart';
import 'package:flutter_base_master/base/state/base_state_controller.dart';

class WebPageController extends BaseStateController {
  WebBean? webBean;
  String? titleId;
  @override
  void loadData() {
    String userUuid = Uri.encodeComponent("5C:C3:07:74:73:4C");
    var params =
        ParamUtils()
            .add("userUuid", userUuid)
            .add("userCode", "")
            .add("titleId", titleId)
            .params;
    Request.post<dynamic>(RequestApi.webData, params, success: (data) {
      webBean = WebBean.fromJson(data);
      showSuccess();
    });
  }
  void setTitle(String titleId) =>this.titleId =titleId;
}
