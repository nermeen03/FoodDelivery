import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference{

  static Future<bool> getShared() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogged') ?? false;
  }
  static setShared() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogged', true);
  }
  static clear() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}