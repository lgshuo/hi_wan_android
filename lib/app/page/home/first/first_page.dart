import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/app/widget/common_list_item.dart';
import 'package:flutter_base_master/base/widget/list_view/refresh_list_view_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'first_page_controller.dart';

class FirstPage extends BaseRefreshListViewPage<FirstPageController>{

  @override
  Widget itemView(BuildContext context, int index) {
    return Text("");
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick
  }

  @override
  FirstPageController putController() {
  return Get.put<FirstPageController>(FirstPageController());
  }

  @override
  Widget listBuilder(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildBannerUI(),
        _buildListUI(context,getController().topArtList,true),
        _buildListUI(context,getController().datas,false),

      ],
    );
  }


  ///首页轮播图
  _buildBannerUI() {
   var bannerList = getController().bannerList;
    return SliverToBoxAdapter(
      child: Container(
        height: 370.h,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: new Image.network(
                  bannerList[index].imagePath!,
                  fit: BoxFit.cover,
                ),
                onTap: () {

                });
          },
          autoplay: true,
          itemCount: bannerList.length,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(activeColor: R.color().primary)),
        ),
      ),
    );
  }

  _buildListUI(BuildContext context,List<HomeListBean> items,bool istop){
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return CommonListItem(
          homeListBean: items[index],
          isTop: istop,
        );
      }, childCount: items.length),
    );
  }

  @override
  void onInitState() {
    getController().initData();
  }
}

