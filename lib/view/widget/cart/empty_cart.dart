import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/routes/routes.dart';
import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/widget/auth/auth_button.dart';

class EmptyCart extends StatelessWidget {
  EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.remove_shopping_cart_outlined,
            color: Colors.grey[600],
            size: width * .55,
          ),
          SizedBox(
            height: height * .04,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Your Cart is ",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Empty",
                style: TextStyle(
                    color: mmainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Add Items To get start",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.grey[500]),
          ),
          SizedBox(
            height: height * .04,
          ),
          // AuthButton(
          //     text: "Back",
          //     onPressed: () {
          //       Get.toNamed(Routes.mainScreen);
          //     },
          //     width: width * .4),
          // SizedBox(
          //   height: height * .04,
          // )
        ],
      ),
    );
  }
}
