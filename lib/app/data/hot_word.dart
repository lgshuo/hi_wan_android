class HotWord {
  HotWord({
      this.id, 
      this.link, 
      this.name, 
      this.order, 
      this.visible,});

  HotWord.fromJson(dynamic json) {
    id = json['id'];
    link = json['link'];
    name = json['name'];
    order = json['order'];
    visible = json['visible'];
  }
  int? id;
  String? link;
  String? name;
  int? order;
  int? visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['link'] = link;
    map['name'] = name;
    map['order'] = order;
    map['visible'] = visible;
    return map;
  }

}