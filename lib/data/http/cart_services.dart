import 'package:http/http.dart' as http;

import '../../core/converters/http_list_converter.dart';
import '../data_providers/data_provider.dart';
import '../models/cart_item.dart';
import '../models/new_cart_item.dart';

class CartServices {
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
}
