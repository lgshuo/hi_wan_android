abstract class RequestApi {
  static const String baseUrl = "https://www.wanandroid.com";
  static const String homeBanner = "/banner/json";
  static const String homeTop = "/article/top/json";
  static String gethomeList(int pageIndex) =>"/article/list/$pageIndex/json";
  static String collect(String id) =>"/lg/collect/$id/json";
  static String uncollect(String id) =>"/lg/uncollect_originId/$id/json";
  static String getsquareList(int pageIndex) =>"/user_article/list/$pageIndex/json";
  static String getaskList(int pageIndex) =>"/wenda/list/$pageIndex/json";
  static String getSearchList(int pageIndex) =>"/article/query/$pageIndex/json";
  static String getProjectList(int pageIndex) =>"/project/list/$pageIndex/json";
  static const String hotkey ="/hotkey/json";
  static const String project ="/project/tree/json";
}
