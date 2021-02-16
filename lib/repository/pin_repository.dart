import 'package:shared_preferences/shared_preferences.dart';

class PinRepository {
  static String keyName = "pin";

  Future<String> getPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyName);
  }

  Future<bool> setPin(String newPin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(keyName, newPin);
  }
}
