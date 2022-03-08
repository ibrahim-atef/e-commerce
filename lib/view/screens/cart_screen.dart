import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/cart_controller.dart';
import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/widget/cart/cart_product_card.dart';
import 'package:testgeo/view/widget/cart/cart_total.dart';
import 'package:testgeo/view/widget/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: mmainColor,
            title: Text("Cart Items"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    controller.clearAllProducts();
                  },
                  icon: Icon(Icons.delete_sweep))
            ],
          ),
          body: Obx(() {
            if (controller.productsMap.isEmpty) {
              return EmptyCart();
            } else {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .8,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              productModels:
                                  controller.productsMap.keys.toList()[index],
                              index: index,
                              quantity:
                                  controller.productsMap.values.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              indent: 15,
                              endIndent: 15,
                              color: Colors.black54,
                              thickness: .4,
                            );
                          },
                          itemCount: controller.productsMap.length),
                    ),
                    CartTotal()
                  ],
                ),
              );
            }
          })

          // EmptyCart(),
          ),
    );
  }
}
