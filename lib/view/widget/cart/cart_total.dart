import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/cart_controller.dart';
import 'package:testgeo/routes/routes.dart';
import 'package:testgeo/view/widget/text_utils.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(4, 0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * .3,
              child: Column(
                children: [
                  TextUtils(
                      text: "Total",
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      underLine: TextDecoration.none),
                  SizedBox(
                    height: 4,
                  ),
                  TextUtils(
                      text: "\$${controller.total}",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      underLine: TextDecoration.none)
                ],
              ),
            ),
            SizedBox(
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.paymentScreen);
                    },
                    child: Container(
                      height: height * .06,
                      width: width * .6,
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
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Check Out",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      );
    });
  }
}
