import 'package:shared_preferences/shared_preferences.dart';

/// 缓存管理类
class SPUtils {
  SharedPreferences? prefs;

  static SPUtils? _instance;

  SPUtils._() {
    init();
  }

  SPUtils._pre(SharedPreferences prefs) {
    this.prefs = prefs;
  }

  /// 预初始化，防止在使用 get 时，prefs还未完成初始化
  static Future<SPUtils> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = SPUtils._pre(prefs);
    }
    return _instance!;
  }

  static SPUtils getInstance() {
    if (_instance == null) {
      _instance = SPUtils._();
    }
    return _instance!;
  }

  void init() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  remove(String key) {
    prefs?.remove(key);
  }
  put(String key,Object value) {
    if (value is int) {
      prefs?.setInt(key, value);
    } else if (value is String) {
      prefs?.setString(key, value);
    } else if (value is double) {
      prefs?.setDouble(key, value);
    }else if (value is bool) {
      prefs?.setBool(key, value);
    }else if (value is List<String>) {
      prefs?.setStringList(key, value);
    }
  }
  T? get<T>(String key) {
    var result = prefs?.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }
}
