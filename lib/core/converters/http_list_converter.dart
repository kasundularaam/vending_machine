import 'dart:convert';

import '../../data/models/cart_item.dart';
import '../../data/models/product.dart';
import '../../data/models/product_category.dart';
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

  static List<ProductCategory> parseCategories(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ProductCategory>(
          (json) => ProductCategory.fromMap(json),
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
