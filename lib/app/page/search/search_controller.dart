import 'package:flutter/cupertino.dart';
import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/base/state/base_state_controller.dart';
import 'package:flutter_base_master/base/utils/keyboard_util.dart';
import 'package:flutter_base_master/base/utils/sp_utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SearchController extends BaseStateController {
  var changeText = ''.obs;
  var searchResult = <HomeListBean>[].obs;
  var showResult = false.obs;
  var  history = <String>[].obs;
  TextEditingController textController = TextEditingController(text: '');

  ///点击搜索存储搜索记录
  void searchWord() {
    if (changeText.value.isEmpty) {
      return;
    }
    ///显示加载数据
    showResult.value = true;
    showLoading();
    ///更新搜索历史
    SPUtils.getInstance().put("search",changeText.value);
    notifySearchHistory();
    ///隐藏软键盘
    if(Get.context != null){
      KeyboardUtils.hideKeyboard(Get.context!);
    }
    ///请求数据
    // request.searchKeyWord(page, changeText.value, success: (data, over) {
    //   searchResult.value = data;
    //   showSuccess(searchResult);
    // }, fail: (code, msg) {
    //   showError();
    // });
  }
  ///组建成搜索历史Widget
  void notifySearchHistory() {
    var historyShow = SPUtils.getInstance().get("search");

    ///最大显示10个历史记录
    if (historyShow.length > 10) {
      historyShow = historyShow.sublist(0, 10);
    }
    history.value = historyShow;
  }
}
