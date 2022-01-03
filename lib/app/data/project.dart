class ProjectBean {
  ProjectBean({
      this.children, 
      this.courseId, 
      this.id, 
      this.name, 
      this.order, 
      this.parentChapterId, 
      this.userControlSetTop, 
      this.visible,});

  ProjectBean.fromJson(dynamic json) {
    if (json['children'] != null) {
      children = [];
    }
    courseId = json['courseId'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    parentChapterId = json['parentChapterId'];
    userControlSetTop = json['userControlSetTop'];
    visible = json['visible'];
  }
  List<dynamic>? children;
  int? courseId;
  int? id;
  String? name;
  int? order;
  int? parentChapterId;
  bool? userControlSetTop;
  int? visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (children != null) {
      map['children'] = children?.map((v) => v.toJson()).toList();
    }
    map['courseId'] = courseId;
    map['id'] = id;
    map['name'] = name;
    map['order'] = order;
    map['parentChapterId'] = parentChapterId;
    map['userControlSetTop'] = userControlSetTop;
    map['visible'] = visible;
    return map;
  }

}