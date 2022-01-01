import 'package:flutter/cupertino.dart';
import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/app/data/hot_word.dart';
import 'package:flutter_base_master/base/http/request/base_request.dart';
import 'package:flutter_base_master/base/http/request/param_utils.dart';
import 'package:flutter_base_master/base/http/request/request_api.dart';
import 'package:flutter_base_master/base/utils/keyboard_util.dart';
import 'package:flutter_base_master/base/utils/sp_utils.dart';
import 'package:flutter_base_master/base/widget/list_view/base_refresh_list_view_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SearchController extends BaseRefreshListViewController<HomeListBean> {
  var changeText = ''.obs;
  var hotWord = <HotWord>[].obs;
  var showResult = false.obs;
  var history = <String>[].obs;
  TextEditingController textController = TextEditingController(text: '');

  ///点击搜索存储搜索记录
  void searchWord() {
    if (changeText.value.isEmpty) {
      return;
    }

    ///显示加载数据
    showResult.value = true;
    page = 0;
    datas.clear();
    showLoading();

    ///更新搜索历史
    SPUtils.getInstance().saveSearchHistory(changeText.value);
    notifySearchHistory();

    ///隐藏软键盘
    if (Get.context != null) {
      KeyboardUtils.hideKeyboard(Get.context!);
    }
   loadData();
  }

  ///点击搜索历史或者热搜榜中的item
  ///[items] 搜索的内容
  void hotOrHistorySearch(String items) {
    ///改变存储中的值
    changeText.value = items;

    ///改变输入框内容，并更新当前光标在尾部
    textController.text = items;
    textController.selection =
        TextSelection(baseOffset: items.length, extentOffset: items.length);
    searchWord();
  }

  ///组建成搜索历史Widget
  void notifySearchHistory() {
    var historyShow = SPUtils.getInstance().getSearchHistory();
    ///最大显示10个历史记录
    if (historyShow.length > 10) {
      historyShow = historyShow.sublist(0, 10);
    }
    history.value = historyShow;
  }
  ///获取搜索热词
  void getSearchHotWord() {
    Request.get<dynamic>(RequestApi.hotkey,null, success:(data){
      data.forEach((element) {
        hotWord.add(HotWord.fromJson(element));
      });
      showSuccess();
    });
  }
  void clearSearchHistory() {
    SPUtils.getInstance().deleteSearchHistory();
    history.value = [];
  }

  @override
  void loadData() {
    ///请求数据
    var params = ParamUtils().add("k", changeText.value).params;
    Request.post<dynamic>(RequestApi.getSearchList(page),params, success:(data){
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
