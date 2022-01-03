import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/project/project_controller.dart';
import 'package:flutter_base_master/app/page/project/project_item_page.dart';
import 'package:flutter_base_master/base/state/base_state_controller.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
import 'package:flutter_base_master/base/widget/list_view/base_refresh_list_view_controller.dart';
import 'package:get/get.dart';

class ProjectPage extends BaseStatelessView<ProjectController> {
   TabController? tabController;

  @override
  ProjectController putController() {
    return Get.put<ProjectController>(ProjectController());
  }

  @override
  Widget successWidget(BaseStateController controller, BuildContext context) {
      tabController = TabController(length: getController().tabs.length, vsync: ScrollableState());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          width: double.infinity,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            controller: tabController,
            tabs: getController().tabs.map((e) {
              return Tab(
                text: e.name,
              );
            }).toList(),
          ),
        ),
      ),
      body: TabBarView(
          controller: tabController!,
          children: getController()
              .tabs
              .map((project) => ProjectItemPage(project.id!))
              .toList()),
    );
  }

  @override
  void onInitState() {
    getController().showLoading();
    getController().getTabs();
  }

  ProjectController getController() {
    return Get.find<ProjectController>();
  }
}
