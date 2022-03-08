import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/cart_controller.dart';
import 'package:testgeo/model/product_model.dart';

import '../text_utils.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;

  AddCart({Key? key, required this.price, required this.productModels})
      : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                text: "Price",
                color: Colors.grey,
                underLine: TextDecoration.none,
              ),
              Text(
                "\$$price",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              controller.addProductsToCart(productModels);
            },
            child: Container(
              height: height * .05,
              width: width * .65,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    Color(0xffcc6213),
                    Color(0xffba0b08),
                    Color(0xff931c04),
                    Color(0xff3f0303),
                  ],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                          fontSize: 22,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
