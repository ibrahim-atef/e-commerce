import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/product_controller.dart';
import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/widget/text_utils.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.favoriteList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  // child: Image.asset(
                  //   "assets/images/heart.png",
                  //   color: mmainColor,
                  // ),
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.grey[400],
                    size: MediaQuery
                        .of(context)
                        .size
                        .width * .7,
                  ),
                ),
                TextUtils(
                    text: "You Don't have favorites",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    underLine: TextDecoration.none)
              ],
            ),
          );
        } else {
          return ListView.separated(        physics: BouncingScrollPhysics(),

              itemBuilder: (context, index) {
                return BuildFavItems(context,
                    image: controller.favoriteList[index].image,
                    price: controller.favoriteList[index].price,
                    name: controller.favoriteList[index].title,
                    productId: controller.favoriteList[index].id);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black,
                  thickness: .2,
                  endIndent: 12,
                  indent: 12,
                );
              },
              itemCount: controller.favoriteList.length);
        }
      }),
    );
  }

  Widget BuildFavItems(BuildContext context, {
    required String image,
    required String name,
    required double price,
    required int productId,
  }) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
          width: double.infinity,
          height: height * .15,
          child: Row(
            children: [
              SizedBox(
                child: Card(
                  elevation: 2,
                  clipBehavior: Clip.antiAlias,
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
              ),
              Expanded(
                child: SizedBox(
                  width: width * .06,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$name",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        // SizedBox(
                        // height:25,
                        // ),
                        Text(
                          "\$$price",
                          style: TextStyle(
                            // overflow: TextOverflow.ellipsis,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    controller.manageFavorite(productId);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: mmainColor,
                  ))
            ],
          )),
    );
  }
}
