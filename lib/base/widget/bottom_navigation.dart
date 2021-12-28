import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/res/R.dart';

class BottomNavigation extends StatefulWidget {
  List<BottomNavigationBarItem> items;
  List<Widget> pages;

  BottomNavigation(this.items, this.pages, {Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:widget.pages[index],
        bottomNavigationBar: BottomNavigationBar(
          items: widget.items,
          unselectedItemColor: index==widget.pages.length-1?R.color().primary[1]:null,
          selectedItemColor: index==widget.pages.length-1?R.color().primary:null,
          currentIndex: index,
          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ));
  }
}
