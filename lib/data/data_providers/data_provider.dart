import 'package:vending_machine/core/constants/configs.dart';

import '../models/beverage.dart';

class DataProvider {
  static List<Beverage> beverages = [
    Beverage(
      name: "Heal the Bay - IPA",
      image: "assets/beer1.png",
      price: 10,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
    ),
    Beverage(
      name: "Del’s Shandy",
      image: "assets/beer2.png",
      price: 15,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
    ),
    Beverage(
      name: "Miller Lite",
      image: "assets/beer1.png",
      price: 18,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
    ),
    Beverage(
      name: "Miller Lite",
      image: "assets/beer3.png",
      price: 10,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
    ),
    Beverage(
      name: "Heal the Bay - IPA",
      image: "assets/beer4.png",
      price: 10,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
    ),
  ];

  //USER

  static String get user => "$baseUrl/cart/user";
  static String userById(int id) => "$baseUrl/cart/user/$id";

  //AUTH

  static String login(String email, String password) =>
      "$baseUrl/cart/user/?email=$email&password=$password";

  static String get registerImages => "$baseUrl/authService/authService";

  //AUTHENTICATE

  static String get authenticate => "$baseUrl/authService/authanticate";

  //CATEGORY

  static String get category => "$baseUrl/products/category";
  static String categoryById(int id) => "$baseUrl/products/category/$id";

  //PRODUCT

  static String get products => "$baseUrl/products/product";
  static String productsById(int id) => "$baseUrl/products/product/$id";

  //USER

  static String get cart => "$baseUrl/cart/cart";
  static String cartById(int id) => "$baseUrl/cart/cart/$id";

  //CHECKOUT

  static String checkout(int id) => "$baseUrl/cart/cart/checkout/$id";
}
