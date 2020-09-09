import 'package:shared_preferences/shared_preferences.dart';

class Helperfunctions {
  static String sharedpreferenceUserNameKey = 'USERNAMEKEY';
  static String sharedpreferenceEmailNameKey = 'USEREMAILKEY';

  static Future<void> saveUserNameSharedPreference(String username) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(sharedpreferenceUserNameKey, username);
  }

  static Future<void> saveUserEmailSharedPreference(String userEmail) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(sharedpreferenceEmailNameKey, userEmail);
  }

//get data from shared pref
  static Future<String> getUserEmailSharedPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    return await pref.getString(sharedpreferenceEmailNameKey);
  }

  static Future<String> getUserNameSharedPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    return await pref.getString(sharedpreferenceUserNameKey);
  }
}
