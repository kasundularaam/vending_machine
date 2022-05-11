import 'package:http/http.dart' as http;

import '../../core/converters/http_list_converter.dart';
import '../data_providers/data_provider.dart';
import '../models/product.dart';

class ProductServices {
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
}
