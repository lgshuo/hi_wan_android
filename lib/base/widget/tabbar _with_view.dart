import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/res/R.dart';

class TabBarWithView extends StatefulWidget {
  List<String> _listTitle;
  List<Widget> pages;

  TabBarWithView(this._listTitle, this.pages, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TabBarWithViewState();
  }
}

class TabBarWithViewState extends State<TabBarWithView> {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: widget._listTitle.length,
      vsync: ScrollableState(),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: 45,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: R.color().primary,
            labelColor: R.color().primary,
            //选中的颜色
            labelStyle: TextStyle(color: R.color().primary, fontSize: 14),
            unselectedLabelColor: Colors.black54,
            //未选中的颜色
            unselectedLabelStyle:
                TextStyle(color: Colors.black54, fontSize: 14),
            isScrollable: false,
            controller: _controller,
            tabs: widget._listTitle.map((e) => Tab(text: e)).toList(),
          ),
        ),
        Expanded(
            child: TabBarView(controller: _controller, children: widget.pages)),
      ],
    );
  }
}
