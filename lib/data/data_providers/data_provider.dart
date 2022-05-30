import 'package:vending_machine/core/constants/configs.dart';

class DataProvider {
  //USER

  static String get user => "$baseUrl/cart/user/";
  static String userById(int id) => "$baseUrl/cart/user/$id/";

  //AUTH

  static String login(String email, String password) =>
      "$baseUrl/cart/user/?email=$email&password=$password";

  static String get registerImages => "$baseUrl/authService/authService/";

  //AUTHENTICATE

  static String get authenticate => "$baseUrl/authService/authanticate/";

  //CATEGORY

  static String get category => "$baseUrl/products/category/";
  static String categoryById(int id) => "$baseUrl/products/category/$id/";

  //PRODUCT

  static String get products => "$baseUrl/products/product/";
  static String productsById(int id) => "$baseUrl/products/product/$id";
  static String productsByDeviceId(String id) =>
      "$baseUrl/products/product?device=$id";

  //USER

  static String get cart => "$baseUrl/cart/cart/";
  static String cartById(int id) => "$baseUrl/cart/cart/$id/";

  //CHECKOUT

  static String checkout(int id) => "$baseUrl/cart/cart/checkout/$id";
}
