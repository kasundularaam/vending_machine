import 'package:shared_preferences/shared_preferences.dart';

class SharedServices {
  static const String uidKey = "uid";

  static Future<int> getUid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int uid = preferences.getInt(uidKey) ?? -1;
    return uid;
  }

  static Future addUser({required int uid}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(uidKey, uid);
  }

  static Future removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(uidKey);
  }

  static Future<bool> isUserIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final int uid = preferences.getInt(uidKey) ?? -1;
    return uid != -1;
  }
}
