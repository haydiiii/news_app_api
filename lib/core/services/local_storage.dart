import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static late SharedPreferences sharPref;
  static init()async {
    sharPref = await SharedPreferences.getInstance();
  }
  static cashData(key, value){
    if (value is String) {
      sharPref.setString(key, value);
    }
    else if (value is int) {
      sharPref.setInt(key, value);
    }
    else if (value is bool) {
      sharPref.setBool(key, value);
    }
  } static getData(key){
    return sharPref.get(key);
  }
}
