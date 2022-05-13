import 'package:shared_preferences/shared_preferences.dart';

class SharedServices {
  static const String uidKey = "uidKey";
  static const String userTypeKey = "userTypeKey";
  static const String deviceIdKey = "deviceIdKey";

  static Future loginAsMachine() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userTypeKey, "machine");
  }

  static Future loginAsUser({required int uid}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userTypeKey, "user");
    preferences.setInt(uidKey, uid);
  }

  static Future setDeviceId({required String id}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(deviceIdKey, id);
  }

  static Future<String> getUserType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userType = preferences.getString(deviceIdKey) ?? "";
    return userType;
  }

  static Future<String> getDeviceId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String deviceId = preferences.getString(userTypeKey) ?? "user";
    return deviceId;
  }

  static Future removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(uidKey);
    preferences.remove(userTypeKey);
  }

  static Future<int> getUid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? uid = preferences.getInt(uidKey);
    if (uid != null) return uid;
    throw "User not available.";
  }

  static Future<bool> isUserIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final int uid = preferences.getInt(uidKey) ?? -1;
    return uid != -1;
  }
}
