import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/res/R.dart';
import 'app/routes/app_pages.dart';
import 'base/utils/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp(ScreenUtilInit(
    designSize: Size(750, 1334),
    builder: () => GetMaterialApp(
      title: "Application",
      theme: ThemeData(backgroundColor: R.color().primary),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  ));
}
