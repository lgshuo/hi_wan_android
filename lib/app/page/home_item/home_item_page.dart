import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/constants/const.dart';
import 'package:flutter_base_master/app/data/home_list_data.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/app/routes/app_pages.dart';
import 'package:flutter_base_master/base/utils/toast_utils.dart';
import 'package:flutter_base_master/base/widget/refresh_list_view_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_item_controller.dart';

class HomeItemPage extends StatefulWidget {
  String? tag;

  HomeItemPage(this.tag);

  @override
  State<StatefulWidget> createState() {
    return HomeItemPageState();
  }
}

class HomeItemPageState extends State<HomeItemPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: R.color().primary),
      child: RefreshListViewWidget<HomeItemController, MainListData>(
          tag: widget.tag,
          init: Get.put<HomeItemController>(HomeItemController(),
              tag: widget.tag),
          initState: (_) {
            var controller = Get.find<HomeItemController>(tag: widget.tag);
            controller.setTitle(widget.tag);
            controller.showLoading();
          },
          itemView: (context, index, data) {
            return Container(
              height: 202.h,
              margin: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 5.h, bottom: 5.h),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                      margin: EdgeInsets.only(left: 40.w),
                      height: 190.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: R.color().white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.w))),
                      child: Container(
                        alignment: AlignmentDirectional.topStart,
                        margin: EdgeInsets.only(
                            left: 140.w, right: 20.w, top: 25.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.title,
                                maxLines: 1,
                                style: TextStyle(
                                    color: R.color().black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26.sp)),
                            Text(data.describes,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: R.color().black, fontSize: 20.sp)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                      height: 140.h,
                      width: 140.h,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(data.posterz, fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                            return loadingProgress == null
                                ? child
                                : CircularProgressIndicator();
                          })),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.bottomEnd,
                    margin: EdgeInsets.only(right: 20.w, bottom: 20.h),
                    child: Text("${data.year}年${data.issue}期",
                        textAlign: TextAlign.end,
                        style:
                            TextStyle(color: Colors.black54, fontSize: 12.sp)),
                  )
                ],
              ),
            );
          },
          onItemClick: (context, index, data) {
            Get.toNamed(Routes.WEB,arguments: {
              Constants.TITLEID:data.titleId,

            });
          }),
    );
  }

  @override

  bool get wantKeepAlive => true;
}
