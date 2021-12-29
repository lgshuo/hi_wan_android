import 'package:flutter_base_master/app/data/banner_bean.dart';
import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/base/http/request/base_request.dart';
import 'package:flutter_base_master/base/http/request/request_api.dart';
import 'package:flutter_base_master/base/widget/list_view/base_refresh_list_view_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FirstPageController extends BaseRefreshListViewController<HomeListBean>{
  var bannerList = <BannerBean>[].obs;
  var topArtList = <HomeListBean>[].obs;

  void initData() {
    page = 0;
    showLoading();
   getBannerListBean();
   getHomeTopArticle();
    getHomeArtList();
  }

  @override
  void loadData() {
    getHomeArtList();
  }

  ///获取首页banner
  void getBannerListBean() {
    bannerList.clear();
    Request.get<dynamic>(RequestApi.homeBanner, null, success: (data) {
      data.forEach((element) {
        bannerList.add(BannerBean.fromJson(element));
      });
    });
  }

  ///获取首页置顶文章
  void getHomeTopArticle() {
    topArtList.clear();
    Request.get<dynamic>(RequestApi.homeTop, null, success: (data) {
      data.forEach((element) {
        topArtList.add(HomeListBean.fromJson(element));
      });
    });
  }

  ///首页列表
  void getHomeArtList() {
    Request.get<dynamic>(RequestApi.gethomeList(page),null, success:(data){
      data["datas"].forEach((element) {
        datas.add(HomeListBean.fromJson(element));
      });
      refreshCompleted();
      loadCompleted();
      showSuccess();
      if (page>=data["pageCount"]) {
        loadNoMore();
      }  
    });
  }
}