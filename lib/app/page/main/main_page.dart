import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/home/first/first_page.dart';
import 'package:flutter_base_master/app/page/home/home_page.dart';
import 'package:flutter_base_master/app/page/project/project_page.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/base/widget/bottom_navigation.dart';

import '../../EmptyPage.dart';

class MainPage extends StatelessWidget {

  var items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页",backgroundColor: R.color().primary),
    BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted), label: "项目",backgroundColor: Colors.blue),
    BottomNavigationBarItem(icon: Icon(Icons.group_work), label: "公众号",backgroundColor: Colors.red),
    BottomNavigationBarItem(icon: Icon(Icons.call_split), label: "体系",backgroundColor: Colors.yellow),
    BottomNavigationBarItem(icon: Icon(Icons.insert_emoticon), label: "我的",backgroundColor: R.color().white),

  ];


  var pages = [
    HomePage(),
    ProjectPage(),
    EmptyPage(),
    EmptyPage(),
    EmptyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigation(items, pages);

  }
}