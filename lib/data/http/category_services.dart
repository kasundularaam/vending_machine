import 'package:http/http.dart' as http;

import '../../core/converters/http_list_converter.dart';
import '../data_providers/data_provider.dart';
import '../models/product_category.dart';

class CategoryServices {
  static Future<List<ProductCategory>> getAllCategories() async {
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

  static Future<ProductCategory> getCategory({required int id}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.cartById(id),
        ),
      );
      if (res.statusCode == 200) return ProductCategory.fromJson(res.body);
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }
}
