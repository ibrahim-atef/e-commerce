import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/cart_controller.dart';
import 'package:testgeo/model/product_model.dart';
import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/widget/text_utils.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quantity;

  CartProductCard(
      {Key? key,
      required this.productModels,
      required this.index,
      required this.quantity})
      : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .18,
      width: width * .8,
      margin: EdgeInsets.only(top: 2, right: 20, left: 20),
      decoration: BoxDecoration(
        // color: mmainColor.withOpacity(.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              elevation: .5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  productModels.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productModels.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  // TextUtils(
                  //     text: "${productModels.category}",
                  //     fontSize: 17,
                  //     fontWeight: FontWeight.w600,
                  //     color: Colors.grey,
                  //     underLine: TextDecoration.none),
                  SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                      text:
                          "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: mmainColor,
                      underLine: TextDecoration.none),
                ],
              )),
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            controller.removeProductsFromCart(productModels);
                          },
                          child: Card(
                            child: Icon(
                              Icons.remove,
                              size: 18,
                              color: Colors.black54,
                            ),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      TextUtils(
                          text: "${quantity}",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          underLine: TextDecoration.none),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          onTap: () {
                            controller.addProductsToCart(productModels);
                          },
                          child: Card(
                            child: Icon(
                              Icons.add,
                              size: 19,
                              color: mmainColor,
                            ),
                          )),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      controller.removeOneProduct(productModels);
                    },
                    child: Icon(
                      Icons.delete_forever,
                      color: Colors.grey[600],
                      size: 27,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
