import 'package:flutter_base_master/app/page/main/main_page.dart';
import 'package:flutter_base_master/app/page/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:flutter_base_master/app/page/main/main_binding.dart';
abstract class Routes {
  static const MAIN = '/main';
  static const SPLASH = '/splash';

}
class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

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
  ];
}
