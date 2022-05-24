import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:vending_machine/data/models/authenticate_res.dart';
import '../../core/converters/http_list_converter.dart';
import '../data_providers/data_provider.dart';
import '../models/new_vm_user.dart';
import '../models/new_vm_user_images.dart';
import '../models/vm_user.dart';
import '../models/vm_user_images.dart';
// import 'package:path/path.dart' as path;

class UserServices {
  static Future<VMUser> getVMUser({required int uid}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.userById(uid),
        ),
      );
      if (res.statusCode == 200) return VMUser.fromJson(res.body);
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<VMUser> login(
      {required String email, required String password}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.login(email, password),
        ),
      );
      if (res.statusCode == 200) {
        return HttpListConverter.parseVMUsers(res.body)[0];
      }
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<VMUser> addVMUser({required NewVMUser newVMUser}) async {
    try {
      final res = await http.post(
          Uri.parse(
            DataProvider.user,
          ),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: newVMUser.toJson());

      if (res.statusCode == 201) return VMUser.fromJson(res.body);
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<VMUser> updateVMUser(
      {required NewVMUser newVMUser, required int id}) async {
    try {
      final res = await http.put(
          Uri.parse(
            DataProvider.userById(id),
          ),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          },
          body: newVMUser.toJson());
      if (res.statusCode == 200) return VMUser.fromJson(res.body);
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<bool> deleteVMUser({required int id}) async {
    try {
      final res = await http.delete(
        Uri.parse(
          DataProvider.userById(id),
        ),
      );
      return res.statusCode == 204;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<VMUserImages> addVMUserImages(
      {required NewVMUserImages newVMUserImages}) async {
    try {
      final res = await http.post(
          Uri.parse(
            DataProvider.registerImages,
          ),
          body: newVMUserImages.toMap());

      if (res.statusCode == 201) return VMUserImages.fromJson(res.body);
      throw "An error occurred";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<VMUser>> getAllUsers() async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.user,
        ),
      );
      if (res.statusCode == 200) {
        return HttpListConverter.parseVMUsers(res.body);
      }
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<AuthenticateRes> authenticate(
      {required File image, required String deviceId}) async {
    try {
//       log('Original path: ${image.path}');
//       String dir = path.dirname(image.path);
//       String newPath = path.join(dir, 'case01wd03id01.jpg');
// print('NewPath: $newPath');
//       image.renameSync(newPath);
//       log(image.path);
      final req = http.MultipartRequest(
        "POST",
        Uri.parse(
          DataProvider.authenticate,
        ),
      );
      req.fields['device'] = "123";
      req.files.add(await http.MultipartFile.fromPath("image", image.path,
          contentType: MediaType('image', 'jpg')));

      final res = await req.send();

      final resStr = await res.stream.bytesToString();
      log(resStr);

      if (res.statusCode == 200) return AuthenticateRes.fromJson(resStr);
      throw "An error occurred";
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
}
