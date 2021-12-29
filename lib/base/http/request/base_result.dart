/// code : 1
/// data : {"appCode":"4c487efca34511eba97000163e04ca99","auditVersionNo":"0","downloadUrl":"http://app.icitycloud.com.cn/apk/qikan/Journalnet-longyuanwang-release-13-1.1.6-20211207_signed.apk","name":"安卓版本更新","note":"1.增加原貌阅读功能\\n","state":1,"versionNo":"1.1.1"}
/// errorMsg : "操作成功"

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class Result<T> {
  int errorCode;
  String errorMsg;
  T data;
  Result(this.errorCode, this.errorMsg, this.data);

  Result.fromJson(Map<String, dynamic> json)
      : errorCode = json['errorCode'],
        errorMsg = json['errorMsg'],
        data = json['data'];

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write(",\"errorCode\":$errorCode");
    sb.write(",\"msg\":\"$errorMsg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}