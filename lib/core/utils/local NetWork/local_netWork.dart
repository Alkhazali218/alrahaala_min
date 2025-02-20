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

  // لتخزين الوقت الحالي (بالملي ثانية)
  static Future<void> storeLastTransactionTime() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    await sharedPre.setInt('lastTransactionTime', currentTime);
  }

  // لاسترجاع الوقت الذي تم فيه آخر تحويل
  static int getLastTransactionTime() {
    return sharedPre.getInt('lastTransactionTime') ?? 0;
  }

  // التحقق إذا مر 6 دقائق منذ آخر تحويل
  static Future<bool> canProceedWithTransaction() async {
    final lastTransactionTime = getLastTransactionTime();
    if (lastTransactionTime == 0) {
      // إذا كانت أول مرة يتم فيها تحويل
      return true;
    }

    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final timeDifference = currentTime - lastTransactionTime;
    return timeDifference >= 360000; // 6 دقائق * 60 ثانية * 1000 ملي ثانية
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
