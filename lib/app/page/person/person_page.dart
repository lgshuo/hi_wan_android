import 'package:flutter/material.dart';
import 'package:flutter_base_master/base/utils/image_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() {
    return _PersonPageState();
  }
}

class _PersonPageState extends State<PersonPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 320.h,
          padding: EdgeInsets.only(left: 40.w),
          color: Colors.blue,
          child: Row(
            children: [
              ClipOval(
                  child: ImageHelper.assest("user_avatar.png", width: 160.w)),
              Container(
                margin: EdgeInsets.only(top: 110.h, left: 40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("name"),
                    SizedBox(height: 30.h),
                    Text("id"),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 280.h),
          decoration: BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.w),
                  topRight: Radius.circular(40.w))),
          child: Column(
            children: [
              
              Row(
                children: [

                ],
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
