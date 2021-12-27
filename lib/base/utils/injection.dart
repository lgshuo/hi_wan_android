import 'sp_utils.dart';

class Injection{

  static Future<void> init() async {
    // shared_preferences
    await  SPUtils.preInit();
  }
}