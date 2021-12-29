import 'package:flutter_base_master/app/page/home/first/article_collection_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleCollectionController>(() => ArticleCollectionController());
  }
}
