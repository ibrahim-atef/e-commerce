import 'package:http/http.dart' as http;
import 'package:testgeo/model/category_model.dart';
import 'package:testgeo/model/product_model.dart';
import 'package:testgeo/utils/my_string.dart';

class CategoryServices {
  static Future <List<String>> getCategory() async {
    var response = await http.get(Uri.parse("$baseUrl/products/categories"));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load products");
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductModels>> getAllCategory(String categoryName) async {
    var response = await http.get(Uri.parse("$baseUrl/products/category/$categoryName"));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return ProductModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load products");
    }
  }
}
