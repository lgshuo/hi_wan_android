import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/search/search_controller.dart';
import 'package:flutter_base_master/app/page/search/search_hot_word_item.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/base/utils/image_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SearchHotWordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 40.w),
            Text(
              "热搜榜",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            ImageHelper.svgAssest(R.drawable().hotWord, width: 32.w),
            SizedBox(width: 40.w),
            Expanded(child: Container()),
          ],
        ),
        SizedBox(height: 10.h),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: getController().hotWord.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 5 / 1),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => getController()
                      .hotOrHistorySearch(getController().hotWord[index].name??""),
                  child: SearchHotWordItem(
                    item: getController().hotWord[index],
                    index: index + 1,
                  ),
                );
              }),
        ),
      ],
    );
  }

  SearchController getController() {
    return Get.find<SearchController>();
  }
}
