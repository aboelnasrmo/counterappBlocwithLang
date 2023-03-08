import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('LOCALE', languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final sharedPrefrences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPrefrences.getString('LOCALE');
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return 'en';
    }
  }
}
