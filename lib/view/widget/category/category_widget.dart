import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/category_controller.dart';
import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/screens/category_screen.dart';
import 'package:testgeo/view/widget/category/category_items.dart';

class CategoryWidget extends StatelessWidget {
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCategoryLoading.value) {
        return Expanded(
          child: Center(
              child: CircularProgressIndicator(
            color: mmainColor,
          )),
        );
      } else {
        return Expanded(
          child: ListView.separated(physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: InkWell(
                      onTap: () {
                        controller.getCategoryIndex(index);
                        Get.to(CategoryItems(
                          categoryTitle: controller.categoryNameList[index],
                        ));
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: mmainColor,
                          image: DecorationImage(
                              image:
                                  NetworkImage(controller.imageCategory[index]),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              controller.categoryNameList[index],
                              style: TextStyle(
                                  backgroundColor: Colors.black38,
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: controller.categoryNameList.length),
        );
      }
    });
  }
}
