import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/product_controller.dart';
import 'package:testgeo/model/product_model.dart';

class SearchTextFormField extends StatelessWidget {
  SearchTextFormField({Key? key}) : super(key: key);
  double radius = 20;
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_) {
      return SizedBox(
        height: 50,
        child: TextField(
            controller: controller.searchTextController,
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            onChanged: (searchName) {
              controller.addSearchToList(searchName);
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              focusColor: Colors.red,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon:controller.searchTextController.text.isNotEmpty? IconButton(
                icon: Icon(Icons.close_rounded, color: Colors.black87,),
                onPressed: () {controller.clearSearch();},
              ):null,
              hintText: "Search with name & price",
              hintStyle: TextStyle(
                color: Colors.black45,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(radius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(radius),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(radius),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(radius),
              ),
            )),
      );
    });
  }
}
