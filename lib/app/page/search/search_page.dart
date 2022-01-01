import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/search/search_controller.dart';
import 'package:flutter_base_master/app/page/search/search_history_widget.dart';
import 'package:flutter_base_master/app/page/search/search_hot_word_widget.dart';
import 'package:flutter_base_master/app/page/search/search_result_widget.dart';
import 'package:flutter_base_master/app/page/search/search_top_widget.dart';
import 'package:flutter_base_master/app/res/R.dart';
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
                  SearchResultWidget(),
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
}
