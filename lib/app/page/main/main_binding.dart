import 'package:flutter_base_master/app/page/home_item/home_item_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeItemController>(
          () => HomeItemController(),tag: "时事"
    );
  }
}
