import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/home_item/home_item_page.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/base/utils/toast_utils.dart';
import 'package:flutter_base_master/base/widget/anim_search_widget.dart';
import 'package:flutter_base_master/base/widget/tabbar%20_with_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  // List<Widget> pages = [HomeItemPage(""),HomeItemPage2(),HomeItemPage3(),HomeItemPage4(),HomeItemPage5()];
  @override
  State<StatefulWidget> createState() {
   return HomePageState();
  }
}
class HomePageState extends State<HomePage>{
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> _listTitle = ['时事', '财经', '军事', '母婴', '健康'];
    List<Widget> pages = _listTitle.map((title) =>new HomeItemPage(title)).toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: R.color().primary,
        title: Text(
          "首页",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          AnimSearchBar(
            textColor: R.color().white,
            preColor: R.color().primary,
            iconColor: R.color().white,
            color: R.color().primary[50],
            width: 750.w,
            rtl: true,
            textController: textController,
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
            onSearchTap: (content) {
              ToastUtils.show(content);
            },
          )
        ],
      ),
      body: TabBarWithView(_listTitle, pages));
  }

}
