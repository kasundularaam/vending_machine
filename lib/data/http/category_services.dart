import 'package:http/http.dart' as http;

import '../../core/converters/http_list_converter.dart';
import '../data_providers/data_provider.dart';
import '../models/category.dart';

class CategoryServices {
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
}
