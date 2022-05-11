import 'package:http/http.dart' as http;

import '../data_providers/data_provider.dart';

class CheckoutServices {
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
