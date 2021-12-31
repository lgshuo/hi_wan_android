import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_master/app/page/search/search_controller.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

/// @class : SearchTopWidget
/// @date : 2021/9/6
/// @name : jhf
/// @description :搜索页面 顶部banner
class SearchTopWidget extends StatelessWidget implements PreferredSizeWidget {
  ///搜索点击事件
  final GestureTapCallback? onTap;

  ///清空内容点击事件
  final GestureTapCallback? deleteTap;

  ///输入框文字变化
  ValueChanged<String>? onChanged;

  ///输入框控制器
  TextEditingController? textController;

  SearchTopWidget(
      {Key? key,
      this.onChanged,
      this.onTap,
      this.deleteTap,
      required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        Row(
          children: [
            SizedBox(width: 30.w),
            InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(40.h),
                ),
                onTap: () => Get.back(),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 24,
                    color: ColorRes.B8C0D4,
                  ),
                )),
            SizedBox(width: 20.w),
            Expanded(
                child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  child: Icon(Icons.search, color: Colors.black87, size: 48.h),
                ),
                Container(
                  height: 72.h,
                  decoration: BoxDecoration(
                    color: Color(0x66E0E6FD),
                    borderRadius: BorderRadius.all(Radius.circular(60.h)),
                  ),
                  child: TextField(
                    textAlign: TextAlign.left,
                    autofocus: false,
                    maxLines: 1,
                    style: TextStyle(color: Colors.black, fontSize: 28.sp),
                    onChanged: onChanged,
                    controller: textController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                    ],
                    ///样式
                    decoration: InputDecoration(
                        fillColor: Colors.white12,
                        filled: true,
                        hintText: "搜索您想要的內容",
                        hintStyle: TextStyle(
                            color: ColorRes.color_B8C0D4, fontSize: 28.sp),
                        border: _getEditBorder(),
                        focusedBorder: _getEditBorder(),
                        disabledBorder: _getEditBorder(),
                        enabledBorder: _getEditBorder(),
                        contentPadding: EdgeInsets.only(
                            top: 12.h, bottom: 12.h, left: 60.w, right: 60.w)),
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Visibility(
                    visible: getController().changeText.value.isNotEmpty,
                    child: InkWell(
                      onTap: deleteTap,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.cancel_rounded,
                          color: ColorRes.color_B8C0D4,
                          size: 36.h,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Text(
                  "搜索",
                  style:
                      TextStyle(color: ColorRes.color_1A2F51, fontSize: 28.sp),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ],
    );
  }

  ///获取输入框的Border属性，可公用
  ///[isEdit]是否获取焦点
  OutlineInputBorder _getEditBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  SearchController getController() {
    return Get.find<SearchController>();
  }

  @override
  Size get preferredSize => Size(ScreenUtil().screenWidth, kToolbarHeight);
}
