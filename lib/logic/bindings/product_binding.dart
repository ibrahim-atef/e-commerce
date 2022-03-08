import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/cart_controller.dart';
import 'package:testgeo/logic/controlles/category_controller.dart';
import 'package:testgeo/logic/controlles/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put (CategoryController());

  }
}