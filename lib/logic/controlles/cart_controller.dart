import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/model/product_model.dart';
import 'package:testgeo/utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductsToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;

    } else {
      productsMap[productModels] = 1;


    }
  }

  void removeProductsFromCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
        title: "remove",
        titleStyle: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        middleText: "Are you sure to Remove products??",
        radius: 5,
        textConfirm: "No",
        textCancel: "Yes",
        onCancel: () {
          productsMap.clear();
        },
        onConfirm: () {
          Get.back();
        },
        buttonColor: mainColor,
        cancelTextColor: Colors.black,
        confirmTextColor: Colors.white);
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return
          // productsMap.entries
          //   .map((e) => e.value)
          //   .toList()

          //   .reduce((value, element) => value + element);
          productsMap.length;
    }
  }
}
