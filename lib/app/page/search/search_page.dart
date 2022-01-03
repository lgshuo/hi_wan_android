import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/search/search_controller.dart';
import 'package:flutter_base_master/app/page/search/search_history_item.dart';
import 'package:flutter_base_master/app/page/search/search_hot_word_widget.dart';
import 'package:flutter_base_master/app/page/search/search_result_widget.dart';
import 'package:flutter_base_master/app/page/search/search_top_widget.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends BaseStatelessView<SearchController> {
  @override
  SearchController putController() {
    return Get.put<SearchController>(SearchController());
  }

  @override
  void onInitState() {
    getController().getSearchHotWord();
    getController().notifySearchHistory();
  }

  @override
  Widget successWidget(SearchController controller, BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Column(
                    children: [
                      ///搜索历史
                      SearchHistoryWidget(),
                      SizedBox(height: 40.h),

                      ///搜索热词
                      SearchHotWordWidget(),
                    ],
                  ),
                  Visibility(
                      visible: getController().showResult.value,
                      child: SearchResultWidget()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget getAppBar() {
    return SearchTopWidget(
      onChanged: (text) {
        getController().changeText.value = text;
        if (text.isEmpty) {
          getController().datas.value = [];
        }
      },
      onTap: () => getController().searchWord(),
      deleteTap: () {
        getController()
          ..changeText.value = ''
          ..showResult.value = false
          ..textController.text = ''
          ..datas.value = [];
      },
      textController: getController().textController,
    );
  }
  SearchHistoryWidget(){
   return Visibility(
        visible: getController().history.isNotEmpty,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 40.w),
                Text(
                  "搜索历史",
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Expanded(child: Container()),
                InkWell(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.h),
                  ),
                  onTap: () => getController().clearSearchHistory(),

                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(Icons.delete_outline_outlined,size: 48.h),
                  ),
                ),
                SizedBox(width: 40.h),
              ],
            ),
            SizedBox(height: 10.w),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                children: [
                  for (String items in getController().history)
                    SearchHistoryItem(
                        name: items,
                        ///改变输入框内容、设置输入框文本、光标移动到尾部、开始搜索数据
                        onTap: () => getController().hotOrHistorySearch(items))
                ],
                crossAxisAlignment: WrapCrossAlignment.center,
              ),
            )
          ],
        ));
  }
}
