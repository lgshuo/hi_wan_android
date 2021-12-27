import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_base_master/app/constants/const.dart';
import 'package:flutter_base_master/app/data/web_bean.dart';
import 'package:flutter_base_master/app/page/web/web_page_controller.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
import 'package:flutter_base_master/base/state/page/error_page.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends BaseStatelessView<WebPageController> {
  late String titleId;

  @override
  void onInitState() {
    titleId = Get.arguments[Constants.TITLEID];
    getController().setTitle(titleId);
    getController().loadData();
  }

  @override
  WebPageController putController() {
    return Get.put<WebPageController>(WebPageController());
  }

  @override
  Widget successWidget(WebPageController controller, BuildContext context) {
    WebBean webBean;
    if (getController().webBean != null) {
      webBean = getController().webBean!;
    } else {
      return ErrorPage(getController());
    }
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(webBean.title!),
          backgroundColor: R.color().primary),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onWebViewCreated: (controller) async {
          var htmlContent =
              HtmlConst.head + webBean.contentText! + HtmlConst.footer;
          await controller.loadHtmlString(htmlContent);
          getController().showSuccess();
        },
      ),
    );
  }
}
