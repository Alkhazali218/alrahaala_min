import 'package:shared_preferences/shared_preferences.dart';

class CacheNetWork {
  static late SharedPreferences sharedPre;

  static cacheInitialization() async {
    sharedPre = await SharedPreferences.getInstance();
  }

  static Future<bool> insterToCache(
      {required String key, required bool value}) async {
    return await sharedPre.setBool(key, value);
  }

  static Future<bool> removeCacheDate({required String key}) async {
    return await sharedPre.remove(key);
  }

  static Future<bool> insterToInfo(
      {required String key, required String value}) async {
    return await sharedPre.setString(key, value);
  }

  static String getCacheDaTaInfo({required String key}) {
    return sharedPre.getString(key) ?? '';
  }

//splashView app
  static dynamic getCacheDaTaSplash({required String key}) {
    return sharedPre.getBool(key);
  }

  static Future<bool> checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('first_launch') ?? true;

    if (isFirstLaunch) {
      await prefs.setBool('first_launch', false);
    }

    return isFirstLaunch;
  }
}
