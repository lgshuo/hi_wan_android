import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/bookshelf/bookshelf_page.dart';
import 'package:flutter_base_master/app/page/home/home_page.dart';
import 'package:flutter_base_master/app/page/mine/mine_page.dart';
import 'package:flutter_base_master/app/page/story/story_page.dart';
import 'package:flutter_base_master/base/widget/bottom_navigation.dart';

class MainPage extends StatelessWidget {

  var items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: "故事会"),
    BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: "书架"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
  ];


  var pages = [
    HomePage(),
    StoryPage(),
    BookshelfPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigation(items, pages);

  }

}