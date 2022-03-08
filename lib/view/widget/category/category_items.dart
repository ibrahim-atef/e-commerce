import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/cart_controller.dart';
import 'package:testgeo/logic/controlles/category_controller.dart';
import 'package:testgeo/logic/controlles/product_controller.dart';
import 'package:testgeo/model/product_model.dart';
import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/screens/product_details_screen.dart';

import '../text_utils.dart';

class CategoryItems extends StatelessWidget {
 final String categoryTitle;

  CategoryItems({Key? key, required this.categoryTitle}) : super(key: key);
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: mmainColor,
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: Obx(() {
        if (categoryController.isAllCategoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: mmainColor,
            ),
          );
        } else {
          return GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: categoryController.categoryList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: .8,
              mainAxisSpacing: 9,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return BuildCard(
                  rate: categoryController.categoryList[index].rating.rate,
                  image: categoryController.categoryList[index].image,
                  price: categoryController.categoryList[index].price,
                  productId: categoryController.categoryList[index].id,
                  context: context,
                  productModels: categoryController.categoryList[index],
                  onTap: () {
                    Get.to(ProductDetailsScreen(
                      productModels: categoryController.categoryList[index],
                    ));
                  });
            },
          );
        }
      }),
    );
  }

  Widget BuildCard(
      {required context,
      required String image,
      required double price,
      required double rate,
      required int productId,
      required ProductModels productModels,
      required Function() onTap}) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                height: height * .22,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //       "$image",
                  //     ),
                  //     fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      elevation: .5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          "$image",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 5,
                      child: Column(
                        children: [
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: CircleAvatar(
                              radius: 17,
                              child: Obx(() {
                                return IconButton(
                                  onPressed: () {
                                    controller.manageFavorite(productId);
                                  },
                                  icon: controller.isFavorite(productId)
                                      ? Icon(
                                          Icons.favorite,
                                          size: 18,
                                          color: mmainColor,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          size: 18,
                                          color: mmainColor,
                                        ),
                                );
                              }),
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: CircleAvatar(
                              radius: 17,
                              child: IconButton(
                                  onPressed: () {
                                    cartController
                                        .addProductsToCart(productModels);
                                  },
                                  icon: Icon(
                                    Icons.add_shopping_cart_outlined,
                                    size: 18,
                                    color: mmainColor,
                                  )),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   bottom: 10,
                    //   right: 0,
                    //   child: Card(
                    //     elevation: 2,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     child: CircleAvatar(
                    //       radius: 17,
                    //       child: IconButton(
                    //           onPressed: () {},
                    //           icon: Icon(
                    //             Icons.add_shopping_cart_outlined,
                    //             size: 18,
                    //             color: mmainColor,
                    //           )),
                    //       backgroundColor: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$$price",
                        style: TextStyle(
                            color: mmainColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20)),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mmainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextUtils(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              text: "$rate",
                              color: Colors.white,
                              underLine: TextDecoration.none,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 13,
                            ),
                            // SizedBox(
                            //   width: .2,
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
