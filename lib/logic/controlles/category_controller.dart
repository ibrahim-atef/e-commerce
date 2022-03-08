import 'package:get/get.dart';
import 'package:testgeo/model/product_model.dart';
import 'package:testgeo/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategoryLoading = false.obs;
  var categoryList = <ProductModels>[].obs;

  List<String> imageCategory = [
    "https://images.unsplash.com/photo-1496171367470-9ed9a91ea931?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZWxlY3Ryb25pY3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
    "https://media.istockphoto.com/photos/gold-jewelry-diamond-rings-show-in-luxury-retail-store-window-display-picture-id1338646661?b=1&k=20&m=1338646661&s=170667a&w=0&h=V__MPGHGBs7p2JNH6tgKlyO6CXBYtPOHIg4KoOzSLp8=",
    "https://media.istockphoto.com/photos/mens-clothing-isolated-on-white-background-picture-id895403704?k=20&m=895403704&s=612x612&w=0&h=gHBH4GnnChsNmHzdyOLDxEIkxdZUkZe7LmggQTW25rI=",
    "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8d29tZW4lMjBmYXNoaW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  ];

  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryServices.getCategory();
    try {
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategorys(String nameCategory) async {
    isAllCategoryLoading(true);
    categoryList.value = await AllCategoryServices.getAllCategory(nameCategory);
    isAllCategoryLoading(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);
    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}
