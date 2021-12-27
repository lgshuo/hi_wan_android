
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../gif_image.dart';

class ListViewFooter extends StatefulWidget {
  ListViewFooter() : super();

  @override
  State<StatefulWidget> createState() {
    return _ListViewFooterState();
  }
}

class _ListViewFooterState extends State<ListViewFooter>
    with SingleTickerProviderStateMixin {
  late GifController _gifController;

  @override
  void initState() {
    // init frame is 2
    _gifController = GifController(
      vsync: this,
      value: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      height: 80,
      builder: (context, mode) {
        return GifImage(
          backgroundColor: Colors.white,
          image: AssetImage(R.drawable().head),
          controller: _gifController,
          height: 80.0,
          width: double.infinity,
        );
      },
      loadStyle: LoadStyle.ShowWhenLoading,
      onModeChange: (mode) {
        if (mode == LoadStatus.loading) {
          _gifController.repeat(
              min: 0, max: 29, period: Duration(milliseconds: 500));
        }
      },
      endLoading: () async {
        _gifController.value = 30;
        return _gifController.animateTo(59,
            duration: Duration(milliseconds: 500));
      },
    );
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }
}