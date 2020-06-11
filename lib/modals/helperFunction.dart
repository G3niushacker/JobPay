import 'package:shared_preferences/shared_preferences.dart';
class HelperFunction {

  static String sharedPrefrenceUSerLoggedinKey = "ISLOGGEDIN";
  static String sharedPrefrenceUSerNameKey = "USERNAMEKEY";
  static String sharedPrefrenceUSerEmailKey = "USEREMAILKEY";
  static String sharedPrefrenceUSerPasswordKey = "USERPASSWORDKEY";
  static String sharedPrefrenceUSerPhoneKey = "USERPHONEKEY";

 Future<SharedPreferences> getSharedPreferences() async {
   final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs;
 }
  static Future<bool> saveUserLoggedInSharedPrefrence(bool isUserLoggedIn) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPrefrenceUSerLoggedinKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPrefrence(String userName) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPrefrenceUSerNameKey, userName);
  }

  static Future<bool> saveUserEmailSharedPrefrence(String userEmail) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPrefrenceUSerEmailKey, userEmail);
  }

  static Future<bool> saveUserPasswordSharedPrefrence(String userPassword) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPrefrenceUSerPasswordKey, userPassword);
  }

  static Future<bool> saveUserPhoneSharedPrefrence(String userPhone) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPrefrenceUSerPasswordKey, userPhone);
  }

  // get SharedPrefrence
save(String key, dynamic value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPrefs.setBool(key, value);
    } else if (value is String) {
      sharedPrefs.setString(key, value);
    } else if (value is int) {
      sharedPrefs.setInt(key, value);
    } else if (value is double) {
      sharedPrefs.setDouble(key, value);
    } else if (value is List<String>) {
      sharedPrefs.setStringList(key, value);
    }
  }
  static Future<bool> getUserLoggedInSharedPrefrence( ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(sharedPrefrenceUSerLoggedinKey);
  }

  static Future<String> getUserNameSharedPrefrence( ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPrefrenceUSerNameKey);
  }

  static Future<String> getUserEmailSharedPrefrence( ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPrefrenceUSerEmailKey);
  }

  static Future<String> getUserPasswordSharedPrefrence( ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPrefrenceUSerPasswordKey);
  }

  static Future<dynamic> getUserPhoneSharedPrefrence( ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPrefrenceUSerPhoneKey);
  }

}