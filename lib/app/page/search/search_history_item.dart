
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// @class : SearchHistoryItem
/// @date : 2021/9/6
/// @name : jhf
/// @description :搜索页面 搜索自适应item
class SearchHistoryItem extends StatelessWidget {

  var name = '';
  ///点击事件
  final GestureTapCallback? onTap;

  SearchHistoryItem({
    Key? key,
    this.name = '',
    this.onTap
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: ColorRes.colorShadow,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Text(
          name,
          style: TextStyle(color: Colors.black, fontSize: 26.sp),
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}