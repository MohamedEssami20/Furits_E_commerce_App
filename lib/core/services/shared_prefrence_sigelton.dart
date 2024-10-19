import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceSigelton {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static void setBoolean(String key, bool value) async {
    await _instance.setBool(key, value);
  }

  static bool? getBoolean({required String key}) {
  return  _instance.getBool(key)??false;
  }
}
