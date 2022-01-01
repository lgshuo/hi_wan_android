import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/search/search_controller.dart';
import 'package:flutter_base_master/app/page/search/search_history_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';

/// @class : SearchHistoryWidget
/// @date : 2021/9/7
/// @name : jhf
/// @description :搜索页面 搜索历史
class SearchHistoryWidget extends StatelessWidget {
  const SearchHistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: getController().history.isNotEmpty,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 40.h),
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
                    child: Icon(Icons.delete,size: 48.h),
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
  SearchController getController(){
    return Get.find<SearchController>();
  }
}
