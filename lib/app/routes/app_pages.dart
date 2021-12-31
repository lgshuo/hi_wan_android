import 'package:flutter_base_master/app/page/home/search/search_page.dart';
import 'package:flutter_base_master/app/page/main/main_page.dart';
import 'package:flutter_base_master/app/page/splash/splash_page.dart';
import 'package:flutter_base_master/app/page/web/web_page.dart';
import 'package:get/get.dart';
import 'package:flutter_base_master/app/page/main/main_binding.dart';
abstract class Routes {
  static const MAIN = '/main';
  static const SPLASH = '/splash';
  static const SEARCH = '/search';
  static const WEB = '/web';

}
class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchPage(),
    ),
    GetPage(
      name: Routes.WEB,
      page: () => WebPage(),
    ),
  ];
}
