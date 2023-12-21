import 'package:http/http.dart' as http;
import 'package:testgeo/model/product_model.dart';
import 'package:testgeo/utils/my_string.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse("$baseUrl/products"),);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return ProductModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load products");
    }
  }
}
