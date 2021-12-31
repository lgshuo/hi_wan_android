import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/search/search_controller.dart';
import 'package:flutter_base_master/app/page/search/search_top_widget.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends BaseStatelessView<SearchController>{
  @override
  SearchController putController() {
   return Get.put<SearchController>(SearchController());
  }

  @override
  Widget successWidget(SearchController controller, BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            SizedBox(height: 30.h),

            // Expanded(
            //   child: Stack(
            //     children: [
            //       Column(
            //         children: [
            //           ///搜索历史
            //           const SearchHistoryWidget(),
            //           Box.vBox20,
            //
            //           ///搜索热词
            //           const SearchHotWordWidget(),
            //         ],
            //       ),
            //       const SearchResultWidget()
            //     ],
            //   ),
            // )
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
          getController().searchResult.value = [];
        }
      },
      onTap: () => getController().searchWord(),
      deleteTap: () {
        getController()
          ..changeText.value = ''
          ..showResult.value = false
          ..textController.text = ''
          ..searchResult.value = [];
      },
      textController: getController().textController,
    );
  }
}