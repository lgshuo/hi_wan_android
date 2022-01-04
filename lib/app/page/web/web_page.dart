import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/data/constant.dart';
import 'package:flutter_base_master/app/page/home/first/article_collection_controller.dart';
import 'package:flutter_base_master/app/page/web/web_controller.dart';
import 'package:flutter_base_master/app/res/R.dart';
import 'package:flutter_base_master/base/state/base_state_controller.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
import 'package:flutter_base_master/base/state/page/error_page.dart';
import 'package:flutter_base_master/base/state/page/loading_page.dart';
import 'package:flutter_base_master/base/utils/third_app_utils.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../EmptyPage.dart';

/**
 * create by lgshuo
 */
class WebPage extends BaseStatelessView<WebPageController> {
  late String articleTitle;
  late String articleUrl;
  late String artId;
  bool isStart = false;
  bool isback = false;
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_controller == null) {
         return false;
        }
        _controller?.canGoBack().then((value) {
          if (value) {
            _controller?.goBack();
          } else {
            Get.back(result: getController().isCollection.value);
            return false;
          }
        });
        return true;
      },
      child: getWidget(context),
    );
  }

  @override
  Widget getWidget(BuildContext context) {
    return GetX<WebPageController>(
      autoRemove: false,
      init: putController(),
      initState: (_) {
        onInitState();
      },
      builder: (_) {
        return Scaffold(
          appBar: getAppBar(),
          body: _getBody(context),
        );
      },
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [successWidget(getController(), context), _bodyWidget(context)],
    );
  }

  _bodyWidget(context) {
    var controller = getController();
    switch (controller.loadState.value) {
      case BaseStateController.LOADING:
        return LoadingPage();
      case BaseStateController.SUCCESS:
        return Container();
      case BaseStateController.EMPTY:
        return EmptyPage();
      case BaseStateController.ERROR:
        return ErrorPage(controller);
    }
    return Text("未知状态");
  }

  @override
  WebPageController putController() {
    return Get.put<WebPageController>(WebPageController());
  }

  @override
  Widget successWidget(WebPageController controller, BuildContext context) {
    return WebView(
      initialUrl: articleUrl,
      javascriptMode: JavascriptMode.unrestricted,
      gestureNavigationEnabled: true,
      onWebViewCreated: (controller) async {
        this._controller = controller;
        print("onWebViewCreated\n");
      },
      onPageStarted: (url) {
        getController().showLoading();
        isStart = true;
        print("onPageStarted\n");
      },
      onPageFinished: (url) {
        print("onPageFinished\n");
      },
      onProgress: (progress) {
        print("progress:${progress}");
        if (progress == 100 &&
            isStart) {
          getController().showSuccess();
          print("progress:${progress}");
        }
      },
      navigationDelegate: (NavigationRequest request) {
        ///TODO isForMainFrame为false,页面不跳转.导致网页内很多链接点击没效果
        debugPrint('导航$request');
        if (!request.url.startsWith('http')) {
          ThirdAppUtils.openAppByUrl(request.url);
          return NavigationDecision.prevent;
        } else {
          return NavigationDecision.navigate;
        }
      },
      onWebResourceError: (error) {},
    );
  }

  @override
  AppBar getAppBar() {
    return AppBar(backgroundColor: R.color().primary,title: Text(articleTitle), centerTitle: true, actions: [
      IconButton(
          onPressed: () {
            _controller?.reload();
          },
          icon: Icon(Icons.refresh)),
      IconButton(
          onPressed: () {
            getController().isCollection.value
                ? Get.find<ArticleCollectionController>()
                    .unCollectionArticle(artId, change: () {
                    getController().isCollection.value = true;
                  })
                : Get.find<ArticleCollectionController>()
                    .collectionArticle(artId, change: () {
                    getController().isCollection.value = true;
                  });
          },
          icon: Icon(getController().isCollection.value
              ? Icons.star
              : Icons.star_border)),
      IconButton(
          onPressed: () {
            Share.share(articleTitle + articleUrl);
          },
          icon: Icon(Icons.share))
    ]);
  }

  @override
  void onInitState() {
    articleTitle = Get.arguments[Constant.ARTICLE_TITLE];
    articleUrl = Get.arguments[Constant.ARTICLE_URL];
    artId = Get.arguments[Constant.ART_ID];
    getController().isCollection.value =
        Get.arguments[Constant.ARTICLE_ISCOLLECT] ?? false;
    getController().showSuccess();
  }
}
