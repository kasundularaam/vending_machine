import 'dart:convert';

import 'package:vending_machine/data/models/cart_item.dart';
import 'package:vending_machine/data/models/product.dart';

import '../../data/models/category.dart';
import '../../data/models/vm_user.dart';

class HttpListConverter {
  static List<VMUser> parseVMUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<VMUser>(
          (json) => VMUser.fromMap(json),
        )
        .toList();
  }

  static List<Category> parseCategories(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Category>(
          (json) => Category.fromMap(json),
        )
        .toList();
  }

  static List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Product>(
          (json) => Product.fromMap(json),
        )
        .toList();
  }

  static List<CartItem> parseCartItems(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CartItem>(
          (json) => CartItem.fromMap(json),
        )
        .toList();
  }
}
