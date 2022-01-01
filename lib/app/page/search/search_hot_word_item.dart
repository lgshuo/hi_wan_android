import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/data/hot_word.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/base/utils/image_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @class : SearchHotWordItem
/// @date : 2021/9/8
/// @name : jhf
/// @description :搜索页面 热搜榜列表Item
class SearchHotWordItem extends StatelessWidget {
  ///列表数据
  HotWord item;

  ///索引
  int index;

  SearchHotWordItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: getBgColor(),
            borderRadius: BorderRadius.all(Radius.circular(4.h)),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              child: Text(
                '$index',
                style: index >3 ? TextStyle(color: Colors.black, fontSize: 24.sp) :TextStyle(color: Colors.white, fontSize: 24.sp),
              )),
        ),
        SizedBox(width: 10.w),
        Text(
          item.name??"",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black, fontSize: 28.sp),
        ),
        SizedBox(width: 6.w),

        Visibility(
          visible: index <= 3,
          child: ImageHelper.svgAssest(
            R.drawable().hotword_item,
            width: 30.w,
          ),
        )
      ],
    );
  }

  ///获取热搜榜中的背景
  Color getBgColor() {
    switch (index) {
      case 1:return Colors.red;
      case 2:return ColorRes.color_FE8C28;
      case 3:return ColorRes.color_FFAE2E;
      default : return ColorRes.colorShadow;
    }
  }
}
