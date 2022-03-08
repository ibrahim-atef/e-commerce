import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/cart_controller.dart';
import 'package:testgeo/view/widget/category/category_widget.dart';
import 'package:testgeo/view/widget/text_utils.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.only(left: 15, top: 15),
        child: Column(
          children:   [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: TextUtils(
                    text: "Category",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    underLine: TextDecoration.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // CategoryWidget
            CategoryWidget()
          ],
        ),
      ),
    );
  }
}
