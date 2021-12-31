import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/base/http/request/base_request.dart';
import 'package:flutter_base_master/base/http/request/request_api.dart';
import 'package:flutter_base_master/base/state/base_state_controller.dart';
import 'package:flutter_base_master/base/utils/toast_utils.dart';

class ArticleCollectionController extends BaseStateController{
  ///收藏文章
  void collectionArticle(String id,{HomeListBean? articleItem,Function()? change}) {
    Request.post<dynamic>(RequestApi.collect(id), null, success: (data) {
        articleItem?.setCollection(true);
        if (change!=null) {
          change;
        }
        ToastUtils.show("收藏成功");
    },fail: (errcode,errmsg){
      ToastUtils.show(errmsg);
    });
  }

  ///取消收藏文章
  void unCollectionArticle(String id,{HomeListBean? articleItem,Function()? change}) {
    Request.post<dynamic>(RequestApi.uncollect(id), null, success: (data) {
      articleItem?.setCollection(false);
      if (change!=null) {
        change;
      }
      ToastUtils.show("取消成功");
    },fail: (errcode,errmsg){
      ToastUtils.show(errmsg);
    });
  }
}