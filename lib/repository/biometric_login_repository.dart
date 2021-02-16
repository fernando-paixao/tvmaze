import 'package:shared_preferences/shared_preferences.dart';

class BiometricLoginRepository {
  static String keyName = "biometricLogin";

  Future<bool> getIsActive() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyName);
  }

  Future<bool> setIsActive(bool isActive) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(keyName, isActive);
  }
}
