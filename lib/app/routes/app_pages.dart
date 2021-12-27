import 'package:flutter_base_master/app/page/main/main_page.dart';
import 'package:flutter_base_master/app/page/web/web_page.dart';
import 'package:get/get.dart';
import 'package:flutter_base_master/app/page/main/main_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.WEB,
      page: () => WebPage(),
    ),
  ];
}
