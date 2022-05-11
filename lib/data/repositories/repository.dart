import 'package:http/http.dart' as http;

import '../../core/converters/http_list_converter.dart';
import '../data_providers/data_provider.dart';
import '../models/cart_item.dart';
import '../models/category.dart';
import '../models/new_cart_item.dart';
import '../models/new_vm_user.dart';
import '../models/new_vm_user_images.dart';
import '../models/product.dart';
import '../models/vm_user.dart';
import '../models/vm_user_images.dart';

class Repository {
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
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          },
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

  static Future<List<Category>> getAllCategories() async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.category,
        ),
      );
      if (res.statusCode == 200) {
        return HttpListConverter.parseCategories(res.body);
      }
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Category> getCategory({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.cartById(id),
        ),
      );
      if (res.statusCode == 200) return Category.fromJson(res.body);
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<Product>> getAllProducts() async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.products,
        ),
      );
      if (res.statusCode == 200) {
        return HttpListConverter.parseProducts(res.body);
      }

      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Product> getProduct({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.productsById(id),
        ),
      );
      if (res.statusCode == 200) return Product.fromJson(res.body);
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<CartItem>> getAllCartItems() async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.cart,
        ),
      );
      if (res.statusCode == 200) {
        return HttpListConverter.parseCartItems(res.body);
      }
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<CartItem> getCartItem({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.cartById(id),
        ),
      );
      if (res.statusCode == 200) return CartItem.fromJson(res.body);
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<CartItem> addToCart({required NewCartItem newItem}) async {
    try {
      final res = await http.post(
          Uri.parse(
            DataProvider.cart,
          ),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          },
          body: newItem.toJson());

      if (res.statusCode == 201) return CartItem.fromJson(res.body);
      throw "An error occurred";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<CartItem> updateCartItem(
      {required NewCartItem newItem, required int id}) async {
    try {
      final res = await http.put(
          Uri.parse(
            DataProvider.cartById(id),
          ),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          },
          body: newItem.toJson());

      if (res.statusCode == 200) return CartItem.fromJson(res.body);
      throw "An error occurred";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<bool> deleteCartItem({required int id}) async {
    try {
      final res = await http.delete(
        Uri.parse(
          DataProvider.cartById(id),
        ),
      );
      return res.statusCode == 204;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> checkout({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.checkout(id),
        ),
      );
      if (res.statusCode == 200) return res.body;
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }
}
