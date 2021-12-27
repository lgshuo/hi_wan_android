import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/home/home_page.dart';
import 'package:flutter_base_master/base/widget/bottom_navigation.dart';

class MainPage extends StatelessWidget {

  var items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),

  ];


  var pages = [
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigation(items, pages);

  }

}