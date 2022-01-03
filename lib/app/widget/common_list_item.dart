import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/data/constant.dart';
import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/app/page/home/first/article_collection_controller.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/app/routes/app_pages.dart';
import 'package:flutter_base_master/base/utils/toast_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CommonListItem extends StatelessWidget {
  final HomeListBean homeListBean;
  final bool isTop;
  final bool isAsk;
  final Color? bgColor;
  final GestureTapCallback? onTap;

  CommonListItem({required this.homeListBean, this.onTap, this.isTop = false,this.isAsk = false,this.bgColor=null});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:bgColor?? R.color().primary,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: R.color().white,
              borderRadius: BorderRadius.all(Radius.circular(20.h))),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: GestureDetector(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !isAsk,
                    child: IconButton(
                        padding: EdgeInsets.all(3.0),
                        icon: homeListBean.collect!
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border),
                        onPressed: () {
                          //点击收藏按钮
                          !homeListBean.collect!
                              ? Get.find<ArticleCollectionController>()
                                  .collectionArticle(
                                      homeListBean.id.toString(), articleItem: homeListBean)
                              : Get.find<ArticleCollectionController>()
                                  .unCollectionArticle(
                                      homeListBean.id.toString(), articleItem: homeListBean);
                        }),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Visibility(
                                //显示“置顶”字样
                                visible: isTop,
                                child: Container(
                                  margin: EdgeInsets.only(right: 20.w),
                                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.w),
                                      border: Border.all(
                                          color: Colors.red, width: 1)),
                                  child: Text(
                                    "置顶",
                                    style: TextStyle(
                                        fontSize: 28.sp, color: Colors.red),
                                  ),
                                )),

                            ///第一行 作者
                            Text(
                              homeListBean.shareUser!.isEmpty
                                  ? homeListBean.author!
                                  : homeListBean.shareUser!,
                              style: TextStyle(fontSize: 28.sp, color: Colors.grey),
                            ),
                            //第一行 右侧 时间
                            Expanded(
                              child: Text(
                                homeListBean.niceDate!,
                                textAlign: TextAlign.right,
                                style:
                                    TextStyle(fontSize: 28.sp, color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.h)),
                        //中间的标题
                        SizedBox(
                          height: 80.h,
                          child: Text(homeListBean.title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 34.sp,
                                  color: R.color().headline,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.h)),
                        //底部的文章类型
                        Text(
                          "${homeListBean.superChapterName}/${homeListBean.chapterName}",
                          style: TextStyle(fontSize: 24.sp, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              onTap: onTap ??
                  () {
                    Get.toNamed(Routes.WEB,arguments: {
                      Constant.ARTICLE_ISCOLLECT:homeListBean.collect,
                      Constant.ART_ID:homeListBean.id.toString(),
                      Constant.ARTICLE_TITLE:homeListBean.title,
                      Constant.ARTICLE_URL:homeListBean.link
                    });
                  })),
    );
  }
}
