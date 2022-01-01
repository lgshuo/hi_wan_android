import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/data/home_list_bean.dart';
import 'package:flutter_base_master/app/page/search/search_controller.dart';
import 'package:flutter_base_master/app/widget/common_list_item.dart';
import 'package:flutter_base_master/base/widget/refresh_list_view_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SearchResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: getController().showResult.value,
      child: Container(
        color: Colors.white,
        child: RefreshListViewWidget<SearchController, HomeListBean>(
          init: null,
          initState: null,
          itemView: (context, index, data) {
            return CommonListItem(homeListBean: data);
          },
        ),
      ),
    );
  }

  SearchController getController() {
    return Get.find<SearchController>();
  }
}
