class UpdateBean {


  UpdateBean.fromJson(dynamic json) {
    appCode = json['appCode'];
    auditVersionNo = json['auditVersionNo'];
    downloadUrl = json['downloadUrl'];
    name = json['name'];
    note = json['note'];
    state = json['state'];
    versionNo = json['versionNo'];
  }
  String appCode="";
  String auditVersionNo="";
  String downloadUrl="";
  String name="";
  String note="";
  int state=0;
  String versionNo="";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appCode'] = appCode;
    map['auditVersionNo'] = auditVersionNo;
    map['downloadUrl'] = downloadUrl;
    map['name'] = name;
    map['note'] = note;
    map['state'] = state;
    map['versionNo'] = versionNo;
    return map;
  }

}